return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      -- event_handlers = {
      --   {
      --     event = "neo_tree_buffer_enter",
      --     handler = function(arg)
      --       vim.cmd([[
      --     setlocal relativenumber
      --   ]])
      --     end,
      --   },
      -- },
      default_component_configs = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰉖",
            folder_empty_open = "󰷏",
       file_size = {
        enabled = false,
        required_width = 64, -- min width of window required to show this column
      },
      type = {
        enabled = false,
        required_width = 122, -- min width of window required to show this column
      },
      last_modified = {
        enabled = false,
        required_width = 88, -- min width of window required to show this column
      },
      created = {
        enabled = false,
        required_width = 110, -- min width of window required to show this column
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
            ["oc"] = "noop",
            ["od"] = "noop",
            ["og"] = "noop",
            ["om"] = "noop",
            ["on"] = "noop",
            ["os"] = "noop",
            ["ot"] = "noop",
          },
        },
      },
    })

    local keymap = vim.keymap -- for conciseness
    -- nvim-tree
    keymap.set("n", "<leader>e", ":Neotree toggle<CR>") -- toggle file explorer
    keymap.set("n", "<leader>git", ":Neotree float git_status<CR>") -- toggle file explorer
  end,
}
