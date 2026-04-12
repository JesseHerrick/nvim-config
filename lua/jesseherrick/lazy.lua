local uv = vim.uv or vim.loop

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
	{ "nvim-lua/plenary.nvim" },
	{ "folke/which-key.nvim" },
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf"
	},
	{ "folke/neodev.nvim" },
	{ "tpope/vim-dispatch" },

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
		-- tag = '0.1.8',
		branch = 'master',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ 'nvim-telescope/telescope-ui-select.nvim' },

	{
		'sainnhe/gruvbox-material',
		name = 'gruvbox-material',
		lazy = false,
		priority = 1000
	},
	{ "catppuccin/nvim",                 name = "catppuccin",    priority = 1000 },

	{ 'nvim-treesitter/nvim-treesitter', branch = 'main', build = { ':TSUpdate' } },
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
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua",           -- optional
			"nvim-mini/mini.pick",        -- optional
			"folke/snacks.nvim",          -- optional
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
		}
	},


	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		}
	},

	'mhartington/formatter.nvim',
	{ 'neovim/nvim-lspconfig' },
	{ 'williamboman/mason.nvim', },
	{ 'williamboman/mason-lspconfig.nvim' },

	-- Autocompletion
	{ 'hrsh7th/nvim-cmp' },    -- Required
	{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
	{ 'L3MON4D3/LuaSnip' },    -- Required
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
	{ "shaunsingh/solarized.nvim" },
	{
		"FabijanZulj/blame.nvim",
		config = function()
			require("blame").setup({
				date_format = "%Y-%m-%d",
			})
		end
	},
	{ "xero/miasma.nvim" },
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{ "pechorin/any-jump.vim" },
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		config = true,
		keys = {
			{ "<leader>a",  nil,                              desc = "AI/Claude Code" },
			{ "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                 desc = "Send to Claude" },
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil" },
			},
			-- Diff management
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{
		"folke/zen-mode.nvim",
		opts = {
			width = 200
		}
	},
	{ "EdenEast/nightfox.nvim" },
	{
		dir = "~/code/dexter.nvim",
		opts = { bin = os.getenv("HOME") .. "/code/dexter/dexter" },
	},
})