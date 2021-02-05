uniform float time;

vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
{
  float modTimer = mod(time, 0.2);
  float deviation;
  if (modTimer < .1) {deviation = 0.003;} else {deviation = -0.003;}
  vec2 coords = vec2(texture_coords.x + deviation, texture_coords.y);
  vec4 c = Texel(texture, coords); // This reads a color from our texture at the coordinates LOVE gave us (0-1, 0-1)
  // return vec4(vec3(1.0, 1.0, 1.0) * (max(color.r, max(color.g, color.b))), 1.0); // This just returns a white color that's modulated by the brightest color channel at the given pixel in the texture. Nothing too complex, and not exactly the prettiest way to do B&W :P
  
  return c;
}
