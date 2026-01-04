local lsp = vim.lsp

-- LEXICAL
-- local lspconfig = require("lspconfig")
-- local configs = require("lspconfig.configs")

-- local lexical_config = {
-- 	filetypes = { "elixir", "eelixir", },
-- 	cmd = { os.getenv("HOME") .. "/code/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
-- 	settings = {},
-- }

-- if not configs.lexical then
-- 	configs.lexical = {
-- 		default_config = {
-- 			filetypes = lexical_config.filetypes,
-- 			cmd = lexical_config.cmd,
-- 			root_dir = function(fname)
-- 				return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
-- 			end,
-- 			-- optional settings
-- 			settings = lexical_config.settings,
-- 		},
-- 	}
-- end

-- lspconfig.lexical.setup({})

vim.lsp.config('expert', {
	cmd = { os.getenv("HOME") .. '/code/expert/apps/expert/burrito_out/expert_darwin_arm64' },
	root_markers = { 'mix.exs', '.git' },
	filetypes = { 'elixir', 'eelixir', 'heex' },
})

vim.lsp.enable 'expert'

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local opts = { remap = false }
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		-- disable formatting by Lexical or ElixirLS
		--
		-- The LSP formatters tend to be slow and synchronous, which locks up the editor. The neoformat plugin does this same
		-- work in the background and much faster.
		-- if (client.name == "lexical" or client.name == "elixirls") and client.server_capabilities then
		-- 	client.server_capabilities.documentFormattingProvider = false
		-- else
		-- 	vim.lsp.buffer_autoformat()
		-- end

		vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "<leader>vo", function() vim.lsp.buf.references() end, opts)
		vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set("n", "<leader>vc", function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)

		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
		vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
		vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
		-- vim.keymap.set("n", "<leader>fb", function() vim.lsp.buf.formatting end, opts)
	end
})

require("mason").setup()
require("mason-lspconfig").setup()
