return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  config = function()
    local silicon = require("nvim-silicon")
    silicon.setup({
      font = "FiraCode Nerd Font=34",
      output = function()
        return os.getenv("HOME") .. "/Pictures/Screenshots/" .. os.date("!%Y-%m-%dT%H-%M-%SZ") .. "_code.png"
      end,
    })
    -- local keymap = vim.keymap -- for conciseness
    --
    -- keymap.set("v", "<leader>nf", silicon.file())
    -- keymap.set("v", "<leader>nn", silicon.shoot())
  end,
}
