return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        -- "c",
        "lua",
        -- "vim",
        "javascript",
        "html",
        "typescript",
        "tsx",
        "rust",
        "json",
        "nix",
        "solidity",
        "markdown",
        -- "ruby",
        "markdown_inline",
        -- "yaml",
        -- "dockerfile",
        -- "graphql",
        "sql",
        "toml",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
    vim.treesitter.language.register("markdown", { "mdx" })

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    -- Adds tree-sitter-tact support
    parser_config.tact = {
      install_info = {
        url = "~/File/treesitter/tree-sitter-tact",
        files = { "src/parser.c" },
        branch = "main",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
    }

    -- Adds filetype recognition for .tact files
    vim.filetype.add({
      extension = {
        tact = "tact",
      },
    })
  end,
}
