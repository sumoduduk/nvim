return {
  "craftzdog/solarized-osaka.nvim",
  name = "solarized_osaka",
  branch = "cterm-compat",
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme solarized-osaka]])
    local solarized = require("solarized-osaka")
    solarized.setup({
      transparent = true,
      day_brightness = 0.6,
    })
  end,
}
