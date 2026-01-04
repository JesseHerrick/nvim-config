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
	{ "rktjmp/hotpot.nvim",   branch = 'main' },
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

	{
		'sainnhe/gruvbox-material',
		name = 'gruvbox-material',
		lazy = false,
		priority = 1000
	},
	{ "catppuccin/nvim",                 name = "catppuccin",    priority = 1000 },

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
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
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
	{ "ludovicchabant/vim-gutentags" },
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
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},

	-- AVANTE STUFF
	--{
	--	"yetone/avante.nvim",
	--	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	--	-- ⚠️ must add this setting! ! !
	--	build = function()
	--		-- conditionally use the correct build system for the current OS
	--		if vim.fn.has("win32") == 1 then
	--			return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
	--		else
	--			return "make"
	--		end
	--	end,
	--	event = "VeryLazy",
	--	version = false, -- Never set this value to "*"! Never!
	--	---@module 'avante'
	--	---@type avante.Config
	--	opts = {
	--		-- add any opts here
	--		-- for example
	--		provider = "claude",
	--		providers = {
	--			claude = {
	--				endpoint = "https://api.anthropic.com",
	--				model = "claude-sonnet-4-20250514",
	--				timeout = 30000, -- Timeout in milliseconds
	--				extra_request_body = {
	--					temperature = 0.75,
	--					max_tokens = 20480,
	--				},
	--			},
	--		},
	--	},
	--	dependencies = {
	--		"nvim-lua/plenary.nvim",
	--		"MunifTanjim/nui.nvim",
	--		--- The below dependencies are optional,
	--		"echasnovski/mini.pick",      -- for file_selector provider mini.pick
	--		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
	--		"hrsh7th/nvim-cmp",           -- autocompletion for avante commands and mentions
	--		"ibhagwan/fzf-lua",           -- for file_selector provider fzf
	--		"stevearc/dressing.nvim",     -- for input provider dressing
	--		"folke/snacks.nvim",          -- for input provider snacks
	--		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
	--		"zbirenbaum/copilot.lua",     -- for providers='copilot'
	--		{
	--			-- support for image pasting
	--			"HakonHarnes/img-clip.nvim",
	--			event = "VeryLazy",
	--			opts = {
	--				-- recommended settings
	--				default = {
	--					embed_image_as_base64 = false,
	--					prompt_for_file_name = false,
	--					drag_and_drop = {
	--						insert_mode = true,
	--					},
	--					-- required for Windows users
	--					use_absolute_path = true,
	--				},
	--			},
	--		},
	--		{
	--			-- Make sure to set this up properly if you have lazy=true
	--			'MeanderingProgrammer/render-markdown.nvim',
	--			opts = {
	--				file_types = { "markdown", "Avante" },
	--			},
	--			ft = { "markdown", "Avante" },
	--		},

	--	},
	--}
})
