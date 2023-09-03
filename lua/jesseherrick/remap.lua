vim.keymap.set("x", "<C-g>", "<Esc>")
vim.keymap.set("n", "<leader>fs", vim.cmd.w)

-- window/split navigation
vim.keymap.set("n", "<leader>1", "<C-w>h")
vim.keymap.set("n", "<leader>2", "<C-w>l")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>|", vim.cmd.vsplit)

-- tab navigation
--
-- this doesn't work right because it makes using `C-i` for navigation slow
-- vim.keymap.set("n", "<C-I><C-I>", function()
-- 	vim.cmd("tabnext")
-- end)

-- remap all the things to escape
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set({ "n", "i", "v" }, "<C-g>", "<Esc>", { noremap = true })

-- quickfix
vim.keymap.set("n", "<leader>'", function()
	vim.cmd("copen")
end)
vim.keymap.set("n", "<leader>cn", function()
	vim.cmd("cnext")
	"zz"
end)

vim.keymap.set("n", "<leader>cp", function()
	vim.cmd("cprev")
	"zz"
end)

-- useful remaps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

function yank(stuff)
	vim.fn.setreg('+', { stuff })

	print("Yanked:", stuff)
end

-- grab the current file and line number
vim.keymap.set("n", "<leader>y", function()
	local current_file = vim.fn.expand('%')
	local current_line = vim.fn.line('.')
	local file_and_line = current_file .. ':' .. current_line

	yank(file_and_line)
end)

vim.keymap.set("n", "<leader>Y", function()
	yank(vim.fn.expand('%'))
end)

-- paste over stuff!
vim.keymap.set("x", "<leader>p", [["_dP]])
