local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'elixirls',
  'gopls'
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>vo", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  lsp.buffer_autoformat()
end)

lsp.setup()

