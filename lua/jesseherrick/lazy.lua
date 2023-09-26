local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	'nvim-lua/plenary.nvim',

	"folke/which-key.nvim",

	{
		"folke/neoconf.nvim",
		cmd = "Neoconf"
	},

	"folke/neodev.nvim",
	"tpope/vim-dispatch",

	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim"
		}
	},
	-- {
	-- 	"jfpedroza/neotest-elixir",
	-- 	dependencies = { "nvim-neotest/neotest" }
	-- },

	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = { { 'nvim-lua/plenary.nvim' } }
	},

	{
		'sainnhe/gruvbox-material',
		name = 'gruvbox-material',
		lazy = false,
		priority = 1000
	},

	{ 'nvim-treesitter/nvim-treesitter', build = { ':TSUpdate' } },
	'nvim-treesitter/playground',
	'ThePrimeagen/harpoon',
	'mbbill/undotree',
	'tpope/vim-fugitive',

	'mhartington/formatter.nvim',
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },          -- Required
			{ 'williamboman/mason.nvim' },        -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },  -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
		}
	},

	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons', -- optional
		}
	},
	'tpope/vim-commentary',
	'tpope/vim-surround',
	'tpope/vim-projectionist',
	'sindrets/diffview.nvim',
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require "telescope".load_extension("frecency")
		end,
		dependencies = { "kkharji/sqlite.lua" }
	},
	{
		'prochri/telescope-all-recent.nvim',
		config = function()
			require('telescope-all-recent').setup {
				-- your config goes here
			}
		end
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build =
		'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	}

	-- {
	-- 	"elixir-tools/elixir-tools.nvim",
	-- 	version = "*",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	config = function()
	-- 		local elixir = require("elixir")
	-- 		local elixirls = require("elixir.elixirls")

	-- 		elixir.setup {
	-- 			nextls = { enable = true },
	-- 			credo = {},
	-- 			elixirls = {
	-- 				enable = false,
	-- 				settings = elixirls.settings {
	-- 					dialyzerEnabled = false,
	-- 					enableTestLenses = true,
	-- 				},
	-- 				on_attach = function(client, bufnr)
	-- 					vim.keymap.set("n", "<leader>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
	-- 					vim.keymap.set("n", "<leader>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
	-- 					vim.keymap.set("v", "<leader>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
	-- 				end,
	-- 			}
	-- 		}
	-- 	end,
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- },
})
