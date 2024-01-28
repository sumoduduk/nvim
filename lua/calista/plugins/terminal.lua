return {
  "rebelot/terminal.nvim",
  config = function()
    require("terminal").setup({
      {
        layout = { open_cmd = "botright new" },
        cmd = { vim.o.shell },
        autoclose = true,
      },
    })

    local term_map = require("terminal.mappings")
    -- vim.keymap.set({ "n", "x" }, "<leader>ts", term_map.operator_send, { expr = true })
    -- vim.keymap.set("n", "<leader>to", term_map.toggle)
    -- vim.keymap.set("n", "<leader>tm", term_map.toggle({ open_cmd = "enew" }))
    -- vim.keymap.set("n", "<leader>tr", term_map.run)
    -- vim.keymap.set("n", "<leader>tR", term_map.run(nil, { layout = { open_cmd = "enew" } }))
    -- vim.keymap.set("n", "<leader>tk", term_map.kill)
    -- vim.keymap.set("n", "<leader>t]", term_map.cycle_next)
    -- vim.keymap.set("n", "<leader>t[", term_map.cycle_prev)
    -- vim.keymap.set("n", "<leader>tl", term_map.move({ open_cmd = "belowright vnew" }))
    -- vim.keymap.set("n", "<leader>tL", term_map.move({ open_cmd = "botright vnew" }))
    -- vim.keymap.set("n", "<leader>th", term_map.move({ open_cmd = "belowright new" }))
    -- vim.keymap.set("n", "<leader>tH", term_map.move({ open_cmd = "botright new" }))
    vim.keymap.set("n", "<leader>tf", term_map.move({ open_cmd = "float" }))

    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
    vim.keymap.set("t", "jk", [[<C-\><C-n>]])
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]])
    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])

    local lazygit = require("terminal").terminal:new({
      layout = { open_cmd = "float", height = 0.9, width = 0.9 },
      cmd = { "lazygit" },
      autoclose = true,
    })

    vim.env["GIT_EDITOR"] = "nvr -cc close -cc split --remote-wait +'set bufhidden=wipe'"
    vim.api.nvim_create_user_command("Lazygit", function(args)
      lazygit.cwd = args.args and vim.fn.expand(args.args)
      lazygit:toggle(nil, true)
    end, { nargs = "?" })

    vim.keymap.set("n", "<leader>lg", ":Lazygit<CR>")
  end,
}
