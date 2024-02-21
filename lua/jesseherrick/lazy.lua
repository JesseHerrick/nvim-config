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
	{
		"jfpedroza/neotest-elixir",
		dependencies = { "nvim-neotest/neotest" }
	},

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

	{ 'nvim-treesitter/nvim-treesitter',            build = { ':TSUpdate' } },
	'nvim-treesitter/playground',
	'ThePrimeagen/harpoon',
	'mbbill/undotree',
	-- 'tpope/vim-fugitive',
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",      -- required
			"sindrets/diffview.nvim",     -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true
	},

	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		}
	},

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
	},

	-- {
	-- 	"harrisoncramer/gitlab.nvim",
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
	-- 		enabled = true,
	-- 	},
	-- 	build = function() require("gitlab.server").build(true) end, -- Builds the Go binary
	-- 	config = function()
	-- 		require("gitlab").setup()                                -- Uses delta reviewer by default
	-- 	end,
	-- },
	{
		'nvim-orgmode/orgmode',
		dependencies = {
			{ 'nvim-treesitter/nvim-treesitter', lazy = true },
		},
		event = 'VeryLazy',
		config = function()
			-- Load treesitter grammar for org
			require('orgmode').setup_ts_grammar()

			-- Setup treesitter
			require('nvim-treesitter.configs').setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { 'org' },
				},
				ensure_installed = { 'org' },
			})

			-- Setup orgmode
			require('orgmode').setup({
				org_agenda_files = '~/notes/**/*',
				org_default_notes_file = '~/notes/refile.org',
			})
		end,
	},

	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "shaunsingh/solarized.nvim" },
	{ "FabijanZulj/blame.nvim" }
})
