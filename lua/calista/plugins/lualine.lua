-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine moonfly theme
local lualine_moonfly = require("lualine.themes.moonfly")

-- new colors for theme
local new_colors = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  black = "#000000",
}

-- change nightlfy theme colors
lualine_moonfly.normal.a.bg = new_colors.blue
lualine_moonfly.insert.a.bg = new_colors.green
lualine_moonfly.visual.a.bg = new_colors.violet
lualine_moonfly.command = {
  a = {
    gui = "bold",
    bg = new_colors.yellow,
    fg = new_colors.black, -- black
  },
}

-- configure lualine with modified theme
lualine.setup({
  options = {
    theme = lualine_moonfly,
  },
})
