vim.keymap.set("x", "<C-g>", "<Esc>", { noremap = true })
vim.keymap.set("n", "<leader>fs", vim.cmd.w)

-- window/split navigation
vim.keymap.set("n", "<leader>1", "<C-w>h")
vim.keymap.set("n", "<leader>2", "<C-w>l")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>|", vim.cmd.vsplit)

-- remap all the things to escape
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set({ "n", "i", "v" }, "<C-g>", "<Esc>", { noremap = true })

-- useful remaps
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
