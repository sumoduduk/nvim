return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- to disable, comment this out
  cmd = { "ConformInfo" },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        -- json = { "prettier" },
        rss = { "prettier" },
        yaml = { "yamlfmt" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        python = { "black", "isort" },
        rust = { "rust_analyzer" },
        nix = { "alejandra" },
        swift = { "swif-format" },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
