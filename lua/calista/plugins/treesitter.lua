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
        "markdown",
        "markdown_inline",
        -- "yaml",
        -- "dockerfile",
        -- "graphql",
        "toml",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
    vim.treesitter.language.register("markdown", { "mdx" })
  end,
}
