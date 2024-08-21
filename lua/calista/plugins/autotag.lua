return {
  "windwp/nvim-ts-autotag",
  config = function()
    local configs = require("nvim-ts-autotag")

    configs.setup({
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
      -- Also override individual filetype configs, these take priority.
      -- Empty by default, useful if one of the "opts" global settings
      -- doesn't work well in a specific filetype
      per_filetype = {
        ["html"] = {
          enable_close = false,
        },
      },
    })
  end,
}
