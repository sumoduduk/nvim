local setup, blankline = pcall(require, "ibl")
if not setup then
  return
end

local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#742A2E" }) -- Even darker red
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#7F7630" }) -- Even darker yellow
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#0F304D" }) -- Darker blue
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#835B37" }) -- Even darker orange
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#5E714D" }) -- Even darker green
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#6A3C7C" }) -- Even darker violet
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#2E5E64" }) -- Even darker cyan
end)

blankline.setup({
  indent = { highlight = highlight },
  scope = {
    enabled = true,
    show_start = false,
  },
})
