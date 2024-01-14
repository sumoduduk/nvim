-- import nvim-tree plugin safely
local setup, neotree = pcall(require, "neo-tree")
if not setup then
  return
end

-- recommended settings from nvim-tree documentation
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

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
    follow_current_file = {
      enabled = true,
    },
    hijack_netrw_behavior = "open_current",
    window = {
      mappings = {
        ["I"] = "toggle_hidden",
        ["o"] = "open",
      },
    },
  },
})
