return {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  lazy = false, -- This plugin is already lazy
  config = function ()
  vim.g.rustaceanvim = {
  -- LSP configuration
  server = {
    standalone = false,
      },
    }
  end,
}
