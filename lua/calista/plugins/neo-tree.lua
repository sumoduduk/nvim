return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
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

    local keymap = vim.keymap -- for conciseness
    -- nvim-tree
    keymap.set("n", "<leader>e", ":Neotree toggle<CR>") -- toggle file explorer
    keymap.set("n", "<leader>git", ":Neotree float git_status<CR>") -- toggle file explorer
  end,
}
