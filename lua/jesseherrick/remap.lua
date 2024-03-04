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
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

function Yank(stuff)
	vim.fn.setreg('+', stuff)

	print("Yanked:", stuff)
end

-- paste over stuff!
vim.keymap.set("x", "<leader>p", [["_dP]])

-- YANKS

-- grab the current file and line number
--
-- think: "yank file"
vim.keymap.set("n", "<leader>yf", function()
	local current_file = vim.fn.expand('%')
	local current_line = vim.fn.line('.')
	local file_and_line = current_file .. ':' .. current_line

	Yank(file_and_line)
end)

-- grabs the absolute file path
--
-- think: "yank File" (absolute)
vim.keymap.set("n", "<leader>yF", function()
	Yank(vim.fn.expand('%'))
end)

-- grab Elixir module

local function get_full_elixir_module()
	local first_line = vim.fn.getline(1)

	return first_line:match("defmodule%s+([%w_%.]+)%s+do")
end

local function extract_elixir_module_parts(full_module_name)
	if full_module_name then
		local module_parts = {}

		for part in full_module_name:gmatch("([^%.]+)") do
			table.insert(module_parts, part)
		end

		return module_parts
	else
		return nil
	end
end

local function current_elixir_module(return_full_module)
	local full_module_name = get_full_elixir_module()

	if return_full_module then
		return full_module_name
	else
		local module_parts = extract_elixir_module_parts(full_module_name)

		if module_parts then
			return module_parts[#module_parts]
		end
	end
end

function CurrentModule(return_full_module)
	local filetype = vim.bo.filetype

	if filetype == "elixir" then
		return current_elixir_module(return_full_module)
	end
end

-- yank local module name
vim.keymap.set("n", "<leader>ym", function()
	local module = CurrentModule(false)

	if module then
		Yank(module)
	end
end)

-- yank full module name
vim.keymap.set("n", "<leader>yM", function()
	local module = CurrentModule(true)

	if module then
		Yank(module)
	end
end)
