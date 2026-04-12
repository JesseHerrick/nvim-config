vim.lsp.config('dexter', {
	-- cmd = { os.getenv("HOME") .. '/code/dexter/dexter', 'lsp' },
	cmd = { 'dexter', 'lsp' },
	root_markers = { '.dexter.db', '.git', 'mix.exs' },
	filetypes = { 'elixir', 'eelixir', 'heex' },
	init_options = {
		debug = true,
	},
})

vim.lsp.enable 'dexter'

-- Optional: jump to first result when all definitions are in the same file
-- (useful for Elixir's multiple function heads). Default behavior shows a picker.
-- vim.lsp.handlers["textDocument/definition"] = function(err, result, ctx, config)
--   if not result or #result == 0 then return end
--   if #result > 1 then
--     local all_same = true
--     for i = 2, #result do
--       if result[i].uri ~= result[1].uri then all_same = false break end
--     end
--     if all_same then result = { result[1] } end
--   end
--   vim.lsp.handlers.declaration(err, result, ctx, config)
-- end

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local opts = { remap = false }
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local builtin = require("telescope.builtin")

		if client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 5000 })
				end,
			})
		end

		vim.keymap.set("n", "<leader>va", function() builtin.lsp_definitions() end, opts)
		vim.keymap.set("n", "<leader>vo", function() builtin.lsp_references({ include_declaration = false }) end, opts)
		vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set("n", "<leader>vc", function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)

		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "[d",
			function() vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.WARN } }) end, opts)
		vim.keymap.set("n", "]d",
			function() vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.WARN } }) end, opts)
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
	end
})

require("mason").setup()
require("mason-lspconfig").setup()

