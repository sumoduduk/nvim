return {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  ft  = 'rust',
  lazy = false, -- This plugin is already lazy
  config = function ()
  vim.g.rustaceanvim = {
  -- LSP configuration
  server = {
				check = {
					overrideCommand = { "cargo", "check", "--message-format=json" },
				},
  },
}
  end,
}
