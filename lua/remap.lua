local helpers = require("helpers")
local yank = helpers.yank
local current_file_and_line = helpers["current-file-and-line"]
local dexter = require("dexter")

-- escaping
vim.keymap.set("x", "<C-g>", "<Esc>")
vim.keymap.set({ "n", "i", "v" }, "<C-g>", "<Esc>", { noremap = true })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })

-- file saving
vim.keymap.set("n", "<leader>fs", vim.cmd.w)

-- window/split navigation
vim.keymap.set("n", "<leader>1", "<C-w>h")
vim.keymap.set("n", "<leader>2", "<C-w>l")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
-- terminal mode window navigation (for escaping terminal buffers like Claude Code)
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>|", vim.cmd.vsplit)
vim.keymap.set("n", "<C-Tab>", function() vim.cmd("tabNext") end)

-- quickfix
vim.keymap.set("n", "<leader>'", function() vim.cmd("copen") end)
vim.keymap.set("n", "<leader>cn", function() vim.cmd("cnext") end)
vim.keymap.set("n", "<leader>cp", function() vim.cmd("cprev") end)

-- useful remaps
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste over stuff!
vim.keymap.set("x", "<leader>p", "\"_dP")

--- Helpful Yanks ---

-- Elixir module helpers
vim.keymap.set("n", "<leader>ym", function() yank(dexter.current_local_module()) end)
vim.keymap.set("n", "<leader>yM", function() yank(dexter.current_module()) end)

-- Git
vim.keymap.set("n", "<leader>gb", function() vim.cmd("BlameToggle") end)

-- File helpers
vim.keymap.set("n", "<leader>yF", function() yank(vim.fn.expand("%")) end)
vim.keymap.set("n", "<leader>yf", function() yank(current_file_and_line()) end)