return {
	"JoosepAlviste/nvim-ts-context-commentstring",
	lazy = true,
	ft = { "javascript", "typescriptreact", "javascriptreact" },
	config = function()
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})
	end,
}
