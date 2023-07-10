-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

local installstatus, tscompile = pcall(require, "nvim-treesitter.install")
if not installstatus then
  return
end

tscompile.compilers = { 'zig' }

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    "c",
    "cpp",
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "markdown",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "rust",
  },
  -- auto install above language parsers
  auto_install = true,
})
