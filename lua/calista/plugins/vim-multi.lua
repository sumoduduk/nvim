return {
  "mg979/vim-visual-multi",
  lazy = false,
  init = function()
    vim.g.VM_maps = {
      ["Find Under"] = "<leader>m",
      ["Find Subword Under"] = "<leader>m",
    }
  end,
}
