vim.api.nvim_create_autocmd("FileType", {
  pattern = "tact",
  callback = function()
    vim.lsp.start({
      name = "tact-extracted-ls",
      cmd = { "tact-extracted-ls", "--stdio" },
    })
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tact",
  command = "silent execute 'TactFmt'",
})
