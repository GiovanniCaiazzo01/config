local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

map("n", "n", "nzzzv", { desc = "Next search result and center" })
map("n", "N", "Nzzzv", { desc = "Previous search result and center" })

map("x", "<leader>p", '"_dP', { desc = "Paste without replacing register" })

map("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
  desc = "Replace word under cursor",
})

map("n", "<leader>x", "<cmd>!chmod +x %<CR>", {
  desc = "Make current file executable",
  silent = true,
})
