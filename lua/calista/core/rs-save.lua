-- This function will be called when a Rust file is saved
local function run_cargo_fmt()
  -- Run the "cargo fmt" command
  vim.api.nvim_command("!cargo fmt")
end

-- Set up an autocommand to call the function when a Rust file is saved
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.rs" }, -- Match Rust files
  callback = run_cargo_fmt, -- Call the function
})
