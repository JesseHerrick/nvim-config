local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set("n", "<leader>pf", builtin.find_files)
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				-- close telescope with jk
				["jk"] = actions.close,
				["<C-g>"] = actions.close,
				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<C-k>"] = require("telescope.actions").move_selection_previous,
				["<C-h>"] = "which_key",
				["<C-q>"] = require("telescope.actions").send_selected_to_qflist
			}
		}
	},
	sorters = {
		"fzy"
	},
	extensions = {
		-- fzf = {
		-- 	fuzzy = true,
		-- 	override_generic_sorter = true,
		-- 	override_file_sorter = true,
		-- 	case_mode = "smart_case",
		-- },
	},
	pickers = {
		find_files = {
			hidden = true
		}
	}
})

vim.keymap.set(
	"n", "<leader><leader>", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
	{ noremap = true, silent = true }
)
