return {
  "tact-lang/tact.vim",
  lazy = false,
  init = function()
    vim.g.tact_prefer_completeFunc = 1
    vim.g.tact_style_guide = 1
    vim.keymap.set("i", "<c-space>", "<c-x><c-o>", { noremap = true, silent = true })
  end,
}
