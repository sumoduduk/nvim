local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  "tsserver",
  "rust_analyzer",
  "tailwindcss",
  "lua_ls",
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
  ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
  ["<tab>"] = cmp.mapping.select_next_item(), -- next suggestion
  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
  ["<C-e>"] = cmp.mapping.abort(), -- close completion window
  ["<CR>"] = cmp.mapping.confirm(cmp_select),
})

cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  sources = {
    { name = "nvim_lsp" }, -- lsp
    { name = "luasnip", keyword_length = 2 }, -- snippets
    { name = "buffer", keyword_length = 3 }, -- text within current buffer
    { name = "path" }, -- file system paths
    { name = "crates" },
  },
})

lsp.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = {
    error = " ",
    warn = " ",
    hint = "ﴞ ",
    info = " ",
  },
})

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts)
  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, opts)
  vim.keymap.set("n", "<leader>vws", function()
    vim.lsp.buf.workspace_symbol()
  end, opts)
  vim.keymap.set("n", "<leader>vd", function()
    vim.diagnostic.open_float()
  end, opts)
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_next()
  end, opts)
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_prev()
  end, opts)
  vim.keymap.set("n", "<leader>ca", function()
    vim.lsp.buf.code_action()
  end, opts)
  vim.keymap.set("n", "<leader>rr", function()
    vim.lsp.buf.references()
  end, opts)
  vim.keymap.set("n", "<leader>rn", function()
    vim.lsp.buf.rename()
  end, opts)
  vim.keymap.set("i", "<C-h>", function()
    vim.lsp.buf.signature_help()
  end, opts)

  if client.name == "tsserver" then
    vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
    vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
    vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
  end
end

lsp.on_attach(on_attach)

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ["null-ls"] = { "javascript", "json", "typescript", "lua", "typescriptreact", "javascriptreact", "solidity" },
    ["rust_analyzer"] = { "rust" },
  },
})

lsp.skip_server_setup({ "rust_analyzer" })

lsp.setup()

local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup({
  on_attach = function(client, bufnr)
    null_opts.on_attach(client, bufnr)
  end,
  sources = {
    --- Replace these with the tools you have installed
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.jq,
    null_ls.builtins.formatting.prettier.with({
      prefer_local = "node_modules/.bin",
    }),
    -- null_ls.builtins.diagnostics.eslint_d.with({
    -- js/ts linter
    -- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
    -- condition = function(utils)
    --     return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
    --   end,
    -- }),
  },
})

require("mason-null-ls").setup({
  ensure_installed = nil,
  automatic_installation = false, -- You can still set this to `true`
  handlers = {
    -- Here you can add functions to register sources.
    -- See https://github.com/jay-babu/mason-null-ls.nvim#handlers-usage
    --
    -- If left empty, mason-null-ls will  use a "default handler"
    -- to register all sources
  },
})

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = on_attach,
  },
})

require("crates").setup({})

vim.diagnostic.config({
  virtual_text = true,
})
