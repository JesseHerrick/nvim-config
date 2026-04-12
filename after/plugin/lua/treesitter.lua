require('nvim-treesitter').setup()

require('nvim-treesitter').install({
	"c", "lua", "vim", "vimdoc", "query",
	"javascript", "typescript", "elixir", "go",
	"markdown", "markdown_inline",
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = '*',
	callback = function() pcall(vim.treesitter.start) end,
})