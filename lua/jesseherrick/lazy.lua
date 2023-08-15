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
	{ "folke/neoconf.nvim",              cmd = "Neoconf" },
	-- "folke/neodev.nvim",

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

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },    -- Required
			{ 'williamboman/mason.nvim' },  -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' }, -- Required
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
})
