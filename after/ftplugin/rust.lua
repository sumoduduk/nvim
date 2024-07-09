local bufnr = vim.api.nvim_get_current_buf()
local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true, buffer = bufnr }
local cmd = vim.cmd



      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "Code Action"
			keymap.set("n", "<Leader>ca", function ()
			 cmd.RustLsp('codeAction')
			end, opts)

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", function ()
			 cmd.RustLsp({'hover', 'actions'})
			end, opts) -- show documentation for what is under cursor

			opts.desc = "Go to previous diagnostic"
      vim.keymap.set('n', '[d', function() -- previous
        vim.diagnostic.jump({ count = -vim.v.count1 })
      end, opts)

			opts.desc = "Go to next diagnostic"
      vim.keymap.set('n', ']d', function() -- next
        vim.diagnostic.jump({ count = vim.v.count1 })
      end, opts)

      opts.desc = "Show line diagnostics"
      vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", function ()
        cmd.RustLsp('openDocs')
      end, opts) -- go to declaration

      opts.desc = "Explain error"
      keymap.set('n', "]e", function ()
        cmd.RustLsp('explainError')
      end, opts)
