return {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  lazy = false, -- This plugin is already lazy
  config = function ()
  vim.g.rustaceanvim = {
  -- LSP configuration
  server = {
    standalone = false,
        root_dir = function (file_name)
    local path = file_name:find('%.toml$') and vim.fs.dirname(file_name) or file_name
    if not path then
      return nil
    end
        end
      },
    }
  end,
}
