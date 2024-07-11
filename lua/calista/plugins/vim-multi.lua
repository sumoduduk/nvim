return {
  "mg979/vim-visual-multi",
  lazy = false,
  init = function()
			vim.g.VM_maps = {
				["Find Under"] = '<leader>n',
				["Find Subword Under"] = '<leader>n',
			}
		end,
}
