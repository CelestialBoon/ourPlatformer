return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 20,
  height = 35,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 5,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "Seasons16",
      firstgid = 1,
      filename = "../Seasons16.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 17,
      image = "../SeasonsTilesheet.png",
      imagewidth = 272,
      imageheight = 320,
      transparentcolor = "#fd4dd3",
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {
        {
          name = "Spring",
          tile = 0,
          properties = {}
        },
        {
          name = "Summer",
          tile = 0,
          properties = {}
        },
        {
          name = "Fall",
          tile = 0,
          properties = {}
        },
        {
          name = "Winter",
          tile = 0,
          properties = {}
        },
        {
          name = "SpringPassable",
          tile = 99,
          properties = {}
        },
        {
          name = "SummerPassable",
          tile = 99,
          properties = {}
        },
        {
          name = "FallPassable",
          tile = 99,
          properties = {}
        },
        {
          name = "WinterPassable",
          tile = 99,
          properties = {}
        }
      },
      tilecount = 340,
      tiles = {
        {
          id = 12,
          type = "coinp"
        },
        {
          id = 13,
          type = "coing"
        },
        {
          id = 14,
          type = "gem"
        },
        {
          id = 15,
          type = "heart"
        },
        {
          id = 29,
          type = "enemy",
          properties = {
            ["name"] = "bat",
            ["verso"] = "r"
          }
        },
        {
          id = 30,
          type = "enemy",
          properties = {
            ["ground?"] = true,
            ["name"] = "slime",
            ["verso"] = "r"
          }
        },
        {
          id = 31,
          type = "enemy",
          properties = {
            ["name"] = "ghost",
            ["verso"] = "r"
          }
        },
        {
          id = 32,
          type = "enemy",
          properties = {
            ["ground?"] = true,
            ["name"] = "spider",
            ["verso"] = "r"
          }
        },
        {
          id = 46,
          type = "enemy",
          properties = {
            ["name"] = "bat",
            ["verso"] = "l"
          }
        },
        {
          id = 47,
          type = "enemy",
          properties = {
            ["ground?"] = true,
            ["name"] = "slime",
            ["verso"] = "l"
          }
        },
        {
          id = 48,
          type = "enemy",
          properties = {
            ["name"] = "ghost",
            ["verso"] = "l"
          }
        },
        {
          id = 49,
          type = "enemy",
          properties = {
            ["ground?"] = true,
            ["name"] = "spider",
            ["verso"] = "l"
          }
        },
        {
          id = 51,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, -1, 0 }
        },
        {
          id = 52,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 0, 0 }
        },
        {
          id = 53,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 0, -1 }
        },
        {
          id = 54,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, -1, 1 }
        },
        {
          id = 55,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 1, 1 }
        },
        {
          id = 56,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 1, -1 }
        },
        {
          id = 57,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, -1, 2 }
        },
        {
          id = 58,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 2, 2 }
        },
        {
          id = 59,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 2, -1 }
        },
        {
          id = 60,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, -1, 3 }
        },
        {
          id = 61,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 3, 3 }
        },
        {
          id = 62,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 3, -1 }
        },
        {
          id = 63,
          type = "player"
        },
        {
          id = 64,
          type = "objective"
        },
        {
          id = 65,
          type = "block"
        },
        {
          id = 68,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, 0, -1, 0 }
        },
        {
          id = 69,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 0, 0, 0, 0 }
        },
        {
          id = 70,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 0, -1, 0, -1 }
        },
        {
          id = 71,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, 1, -1, 1 }
        },
        {
          id = 72,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 1, 1, 1, 1 }
        },
        {
          id = 73,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 1, -1, 1, -1 }
        },
        {
          id = 74,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, 2, -1, 2 }
        },
        {
          id = 75,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 2, 2, 2, 2 }
        },
        {
          id = 76,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 2, -1, 2, -1 }
        },
        {
          id = 77,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, 3, -1, 3 }
        },
        {
          id = 78,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 3, 3, 3, 3 }
        },
        {
          id = 79,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 3, -1, 3, -1 }
        },
        {
          id = 85,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, 0, -1, -1 }
        },
        {
          id = 86,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 0, 0, -1, -1 }
        },
        {
          id = 87,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 0, -1, -1, -1 }
        },
        {
          id = 88,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, 1, -1, -1 }
        },
        {
          id = 89,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 1, 1, -1, -1 }
        },
        {
          id = 90,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 1, -1, -1, -1 }
        },
        {
          id = 91,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, 2, -1, -1 }
        },
        {
          id = 92,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 2, 2, -1, -1 }
        },
        {
          id = 93,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 2, -1, -1, -1 }
        },
        {
          id = 94,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, 3, -1, -1 }
        },
        {
          id = 95,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 3, 3, -1, -1 }
        },
        {
          id = 96,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 3, -1, -1, -1 }
        },
        {
          id = 102,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, 0, 0, 0 }
        },
        {
          id = 103,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 0, -1, 0, 0 }
        },
        {
          id = 104,
          type = "spikes",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 105,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, 1, 1, 1 }
        },
        {
          id = 106,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 1, -1, 1, 1 }
        },
        {
          id = 107,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 108,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, 2, 2, 2 }
        },
        {
          id = 109,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 2, -1, 2, 2 }
        },
        {
          id = 110,
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 111,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, 3, 3, 3 }
        },
        {
          id = 112,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 3, -1, 3, 3 }
        },
        {
          id = 113,
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 119,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 0, 0, -1, 0 }
        },
        {
          id = 120,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 0, 0, 0, -1 }
        },
        {
          id = 121,
          type = "bumper",
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 122,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 1, 1, -1, 1 }
        },
        {
          id = 123,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 1, 1, 1, -1 }
        },
        {
          id = 124,
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 125,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 2, 2, -1, 2 }
        },
        {
          id = 126,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 2, 2, 2, -1 }
        },
        {
          id = 127,
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 128,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 3, 3, -1, 3 }
        },
        {
          id = 129,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 3, 3, 3, -1 }
        },
        {
          id = 130,
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 136,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, -1, 4 }
        },
        {
          id = 137,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 4, 4 }
        },
        {
          id = 138,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 4, -1 }
        },
        {
          id = 139,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, -1, 5 }
        },
        {
          id = 140,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 5, 5 }
        },
        {
          id = 141,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 5, -1 }
        },
        {
          id = 142,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, -1, 6 }
        },
        {
          id = 143,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 6, 6 }
        },
        {
          id = 144,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 6, -1 }
        },
        {
          id = 145,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, -1, 7 }
        },
        {
          id = 146,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 7, 7 }
        },
        {
          id = 147,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 7, -1 }
        },
        {
          id = 153,
          type = "terrain",
          terrain = { -1, 4, -1, 4 }
        },
        {
          id = 154,
          type = "terrain",
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 155,
          type = "terrain",
          terrain = { 4, -1, 4, -1 }
        },
        {
          id = 156,
          type = "terrain",
          terrain = { -1, 5, -1, 5 }
        },
        {
          id = 157,
          type = "terrain",
          terrain = { 5, 5, 5, 5 }
        },
        {
          id = 158,
          type = "terrain",
          terrain = { 5, -1, 5, -1 }
        },
        {
          id = 159,
          type = "terrain",
          terrain = { -1, 6, -1, 6 }
        },
        {
          id = 160,
          type = "terrain",
          terrain = { 6, 6, 6, 6 }
        },
        {
          id = 161,
          type = "terrain",
          terrain = { 6, -1, 6, -1 }
        },
        {
          id = 162,
          type = "terrain",
          terrain = { -1, 7, -1, 7 }
        },
        {
          id = 163,
          type = "terrain",
          terrain = { 7, 7, 7, 7 }
        },
        {
          id = 164,
          type = "terrain",
          terrain = { 7, -1, 7, -1 }
        },
        {
          id = 170,
          type = "terrain",
          terrain = { -1, 4, -1, -1 }
        },
        {
          id = 171,
          type = "terrain",
          terrain = { 4, 4, -1, -1 }
        },
        {
          id = 172,
          type = "terrain",
          terrain = { 4, -1, -1, -1 }
        },
        {
          id = 173,
          type = "terrain",
          terrain = { -1, 5, -1, -1 }
        },
        {
          id = 174,
          type = "terrain",
          terrain = { 5, 5, -1, -1 }
        },
        {
          id = 175,
          type = "terrain",
          terrain = { 5, -1, -1, -1 }
        },
        {
          id = 176,
          type = "terrain",
          terrain = { -1, 6, -1, -1 }
        },
        {
          id = 177,
          type = "terrain",
          terrain = { 6, 6, -1, -1 }
        },
        {
          id = 178,
          type = "terrain",
          terrain = { 6, -1, -1, -1 }
        },
        {
          id = 179,
          type = "terrain",
          terrain = { -1, 7, -1, -1 }
        },
        {
          id = 180,
          type = "terrain",
          terrain = { 7, 7, -1, -1 }
        },
        {
          id = 181,
          type = "terrain",
          terrain = { 7, -1, -1, -1 }
        },
        {
          id = 187,
          type = "terrain",
          properties = {
            ["collidable"] = true,
            ["passable"] = true
          }
        },
        {
          id = 188,
          type = "terrain",
          properties = {
            ["collidable"] = true,
            ["passable"] = true
          }
        },
        {
          id = 189,
          type = "terrain",
          properties = {
            ["collidable"] = true,
            ["passable"] = true
          }
        },
        {
          id = 190,
          type = "terrain",
          properties = {
            ["collidable"] = true,
            ["passable"] = true
          }
        },
        {
          id = 191,
          type = "terrain",
          properties = {
            ["collidable"] = true,
            ["passable"] = true
          }
        },
        {
          id = 192,
          type = "terrain",
          properties = {
            ["collidable"] = true,
            ["passable"] = true
          }
        },
        {
          id = 193,
          type = "terrain",
          properties = {
            ["collidable"] = true,
            ["passable"] = true
          }
        },
        {
          id = 194,
          type = "terrain",
          properties = {
            ["collidable"] = true,
            ["passable"] = true
          }
        },
        {
          id = 195,
          type = "terrain",
          properties = {
            ["collidable"] = true,
            ["passable"] = true
          }
        },
        {
          id = 196,
          type = "terrain",
          properties = {
            ["collidable"] = true,
            ["passable"] = true
          }
        },
        {
          id = 197,
          type = "terrain",
          properties = {
            ["collidable"] = true,
            ["passable"] = true
          }
        },
        {
          id = 198,
          type = "terrain",
          properties = {
            ["collidable"] = true,
            ["passable"] = true
          }
        },
        {
          id = 204,
          type = "terrain",
          properties = {
            ["collidable"] = true,
            ["passable"] = true
          }
        },
        {
          id = 206,
          type = "platVert",
          properties = {
            ["passable"] = true
          }
        },
        {
          id = 207,
          properties = {
            ["collidable"] = true,
            ["passable"] = true
          }
        },
        {
          id = 210,
          properties = {
            ["collidable"] = true,
            ["passable"] = true
          }
        },
        {
          id = 213,
          properties = {
            ["collidable"] = true,
            ["passable"] = true
          }
        },
        {
          id = 221,
          type = "platOriz",
          properties = {
            ["passable"] = true
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 35,
      id = 2,
      name = "Geometry",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 52, 53, 54, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 70, 71, 0, 0, 0, 0, 0, 0, 0,
        54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 87, 88, 0, 0, 0, 0, 0, 0, 0,
        71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        104, 54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 35,
      id = 3,
      name = "Platforms",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 188, 189, 190, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 35,
      id = 4,
      name = "Entities",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 66, 0, 30, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 66, 0, 0, 47, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 66, 0, 0, 47, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 30, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 30, 0, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 30, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
