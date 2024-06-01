return {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  tag = "v0.3.0",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local crates = require("crates")
    crates.setup()
    local opts = { silent = true }

    vim.keymap.set("n", "<leader>co", crates.toggle, opts)
    vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, opts)
    vim.keymap.set("n", "<leader>cf", crates.show_features_popup, opts)
    vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, opts)
  end,
}
