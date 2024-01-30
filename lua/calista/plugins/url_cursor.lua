return {
  "sontungexpt/url-open",
  branch = "mini",
  event = "VeryLazy",
  cmd = "URLOpenUnderCursor",
  config = function()
    local url_open = require("url-open")
    url_open.setup({

      open_only_when_cursor_on_url = false,

      vim.keymap.set("n", "<leader>o", "<esc>:URLOpenUnderCursor<cr>"),
    })
  end,
}
