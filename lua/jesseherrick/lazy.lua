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

-- Bootstrap hotpot into lazy plugin dir if it does not exist yet.
local hotpotpath = vim.fn.stdpath("data") .. "/lazy/hotpot.nvim"
if not vim.loop.fs_stat(hotpotpath) then
	vim.notify("Bootstrapping hotpot.nvim...", vim.log.levels.INFO)
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		-- You may wish to pin a known version tag with `--branch=vX.Y.Z`
		"--branch=v0.9.6",
		"https://github.com/rktjmp/hotpot.nvim.git",
		hotpotpath,
	})
end

-- As per lazy's install instructions, but puts hotpot's path at the front.
vim.opt.runtimepath:prepend({ hotpotpath, lazypath })

require("hotpot")

require("lazy").setup({
	{ "nvim-lua/plenary.nvim" },
	{ "rktjmp/hotpot.nvim",   branch = 'master', tag = 'v0.9.6' },
	{ "folke/which-key.nvim" },
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf"
	},
	{ "folke/neodev.nvim" },
	{ "tpope/vim-dispatch" },

	-- {
	-- 	"nvim-neotest/neotest",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"antoinemadec/FixCursorHold.nvim"
	-- 	}
	-- },
	-- {
	-- 	"jfpedroza/neotest-elixir",
	-- 	dependencies = { "nvim-neotest/neotest" }
	-- },

	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{
		'sainnhe/gruvbox-material',
		name = 'gruvbox-material',
		lazy = false,
		priority = 1000
	},

	{ 'nvim-treesitter/nvim-treesitter', build = { ':TSUpdate' } },
	{ 'nvim-treesitter/playground' },
	{
		'ThePrimeagen/harpoon',
		branch = 'harpoon2',
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim"
		}
	},
	{ 'mbbill/undotree' },
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
	-- {
	-- 	"nvim-telescope/telescope-frecency.nvim",
	-- 	config = function()
	-- 		require "telescope".load_extension("frecency")
	-- 	end,
	-- 	dependencies = { "kkharji/sqlite.lua" }
	-- },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "shaunsingh/solarized.nvim" },
	{
		"FabijanZulj/blame.nvim",
		config = function()
			require("blame").setup()
		end
	},
	{ "xero/miasma.nvim" },
	{ "zbirenbaum/copilot.lua" },
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end
	}
})
