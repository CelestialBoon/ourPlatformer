return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 30,
  height = 80,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 4,
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
          id = 66,
          type = "terrain"
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
          type = "bumper"
        },
        {
          id = 104,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 0, -1, 0, 0 }
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
          id = 107,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 1, -1, 1, 1 }
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
          id = 110,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 2, -1, 2, 2 }
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
          id = 113,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { 3, -1, 3, 3 }
        },
        {
          id = 119,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, -1, 4 }
        },
        {
          id = 120,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 4, 4 }
        },
        {
          id = 121,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 4, -1 }
        },
        {
          id = 122,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, -1, 5 }
        },
        {
          id = 123,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 5, 5 }
        },
        {
          id = 124,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 5, -1 }
        },
        {
          id = 125,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, -1, 6 }
        },
        {
          id = 126,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 6, 6 }
        },
        {
          id = 127,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 6, -1 }
        },
        {
          id = 128,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, -1, 7 }
        },
        {
          id = 129,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 7, 7 }
        },
        {
          id = 130,
          type = "terrain",
          properties = {
            ["collidable"] = true
          },
          terrain = { -1, -1, 7, -1 }
        },
        {
          id = 136,
          type = "terrain",
          terrain = { -1, 4, -1, 4 }
        },
        {
          id = 137,
          type = "terrain",
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 138,
          type = "terrain",
          terrain = { 4, -1, 4, -1 }
        },
        {
          id = 139,
          type = "terrain",
          terrain = { -1, 5, -1, 5 }
        },
        {
          id = 140,
          type = "terrain",
          terrain = { 5, 5, 5, 5 }
        },
        {
          id = 141,
          type = "terrain",
          terrain = { 5, -1, 5, -1 }
        },
        {
          id = 142,
          type = "terrain",
          terrain = { -1, 6, -1, 6 }
        },
        {
          id = 143,
          type = "terrain",
          terrain = { 6, 6, 6, 6 }
        },
        {
          id = 144,
          type = "terrain",
          terrain = { 6, -1, 6, -1 }
        },
        {
          id = 145,
          type = "terrain",
          terrain = { -1, 7, -1, 7 }
        },
        {
          id = 146,
          type = "terrain",
          terrain = { 7, 7, 7, 7 }
        },
        {
          id = 147,
          type = "terrain",
          terrain = { 7, -1, 7, -1 }
        },
        {
          id = 153,
          type = "terrain",
          terrain = { -1, 4, -1, -1 }
        },
        {
          id = 154,
          type = "terrain",
          terrain = { 4, 4, -1, -1 }
        },
        {
          id = 155,
          type = "terrain",
          terrain = { 4, -1, -1, -1 }
        },
        {
          id = 156,
          type = "terrain",
          terrain = { -1, 5, -1, -1 }
        },
        {
          id = 157,
          type = "terrain",
          terrain = { 5, 5, -1, -1 }
        },
        {
          id = 158,
          type = "terrain",
          terrain = { 5, -1, -1, -1 }
        },
        {
          id = 159,
          type = "terrain",
          terrain = { -1, 6, -1, -1 }
        },
        {
          id = 160,
          type = "terrain",
          terrain = { 6, 6, -1, -1 }
        },
        {
          id = 161,
          type = "terrain",
          terrain = { 6, -1, -1, -1 }
        },
        {
          id = 162,
          type = "terrain",
          terrain = { -1, 7, -1, -1 }
        },
        {
          id = 163,
          type = "terrain",
          terrain = { 7, 7, -1, -1 }
        },
        {
          id = 164,
          type = "terrain",
          terrain = { 7, -1, -1, -1 }
        },
        {
          id = 170,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 171,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 172,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 173,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 174,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 175,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 176,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 177,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 178,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 179,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 180,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 181,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 187,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 188,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 189,
          properties = {
            ["collidable"] = false
          }
        },
        {
          id = 190,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 193,
          type = "terrain",
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 196,
          type = "terrain",
          properties = {
            ["collidable"] = true
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
      width = 30,
      height = 80,
      id = 1,
      name = "Tile Layer 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      chunks = {
        {
          x = 0, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 52, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53
          }
        },
        {
          x = 16, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 54, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 0, width = 16, height = 16,
          data = {
            0, 69, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70,
            0, 86, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = 0, width = 16, height = 16,
          data = {
            70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 71, 0, 0, 0, 0,
            87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 88, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 80,
      id = 2,
      name = "Entities",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      chunks = {
        {
          x = 0, y = -64, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = -48, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 80,
      id = 3,
      name = "Platforms",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      chunks = {
        {
          x = 0, y = -64, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 188, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 188, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = -64, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 188, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 188, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = -48, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 188,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 171, 172, 173, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 171, 172, 173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 171, 172, 173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = -48, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 188, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 188, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 188, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 171, 172, 173, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = -32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 171, 172, 173, 0, 0, 0, 171, 172, 173, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 171, 171, 171, 171, 171,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 171, 172, 173, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 171, 172, 173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = -32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 171, 172, 173, 173, 173, 173, 173, 173, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 171, 172, 173, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            171, 171, 171, 171, 171, 171, 172, 173, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 171, 172, 173, 173, 173, 173, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 171,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 171,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 171, 171, 171, 171, 171, 172, 173, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            172, 173, 173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 171, 172, 173, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            171, 171, 171, 171, 172, 173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        }
      }
    }
  }
}
