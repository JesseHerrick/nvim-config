-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 60,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
})

local api = require("nvim-tree.api")

vim.keymap.set("n", "<leader><Tab>", function() api.tree.toggle({ find_file = true }) end)
