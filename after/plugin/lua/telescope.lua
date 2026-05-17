local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local helpers = require("helpers")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files)
vim.keymap.set("n", "<leader>/", builtin.live_grep, {})

local app = os.getenv("NVIM_APP")
local app_root = app and (vim.fn.getcwd() .. "/apps/" .. app) or vim.fn.getcwd()

local function find_app_lib()
	builtin.live_grep({ cwd = app_root .. "/lib" })
end

local function find_app_test()
	builtin.live_grep({ cwd = app_root .. "/test" })
end

vim.keymap.set("n", "<leader>sl", find_app_lib, {})
vim.keymap.set("n", "<leader>st", find_app_test, {})
vim.keymap.set("n", "<leader>fj", function() vim.cmd("Telescope jump_list") end)
vim.keymap.set("n", "<leader>sm", function()
	local current_module = helpers["elixir-current-local-module"]()
	builtin.live_grep({ cwd = app_root .. "/lib", default_text = current_module })
end)
vim.keymap.set("n", "<leader>bb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>ft", builtin.treesitter, {})
vim.keymap.set("n", "<leader>vs", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>vw", builtin.lsp_dynamic_workspace_symbols, {})

local function find_schemas()
	builtin.find_files({
		prompt_title = "Find Ecto Schemas",
		find_command = { "sh", "-c", "rg -g '*.ex' --files-with-matches 'use.*\\.Ecto\\.Schema' | xargs rg --files-with-matches 'schema \"'" },
	})
end

vim.keymap.set("n", "<leader>ps", find_schemas, {})

telescope.setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
	defaults = {
		mappings = {
			i = {
				["jk"] = actions.close,
				["<C-g>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-h>"] = "which_key",
				["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		git_files = {
			show_untracked = true,
		},
	},
})

telescope.load_extension("ui-select")