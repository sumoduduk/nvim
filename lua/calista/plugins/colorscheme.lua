return {
  "craftzdog/solarized-osaka.nvim",
  name = "solarized_osaka",
  lazy = false,
  config = function()
    require("solarized-osaka").setup({
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    })

    vim.cmd([[colorscheme solarized-osaka]])
  end,
}
