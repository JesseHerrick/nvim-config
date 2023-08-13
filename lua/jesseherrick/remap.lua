vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ff", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fs", vim.cmd.w)

-- window/split navigation
vim.keymap.set("n", "<leader>1", function() vim.cmd("wincmd h") end)
vim.keymap.set("n", "<leader>2", function() vim.cmd("wincmd l") end)

-- remap all the things to escape
vim.keymap.set("i", "jk", "<Esc>", {noremap = true})
vim.keymap.set({"n", "i", "v"}, "<C-g>", "<Esc>", {noremap = true})

