vim.api.nvim_create_autocmd("FileType", {
  pattern = "*.md",
  callback = function()
    vim.cmd("LspStop")
  end,
})
