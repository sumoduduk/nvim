local neotree = require("neo-tree")

neotree.setup({
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function(arg)
        vim.cmd([[
          setlocal relativenumber
        ]])
      end,
    },
  },
  default_component_configs = {
    icon = {
      folder_closed = "",
      folder_open = "",
    },
  },
  window = {
    width = 30,
    mappings = {
      ["o"] = "open",
    },
  },
  filesystem = {
    filtered_items = {
      always_show = {
        ".gitignore",
      },
    },
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    window = {
      mappings = {
        ["I"] = "toggle_hidden",
      },
    },
  },
})
