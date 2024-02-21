vim.g.gruvbox_material_foreground = 'mix'
vim.g.gruvbox_material_background = 'hard'

local grpid = vim.api.nvim_create_augroup('custom_highlights_gruvbox-material', {})
vim.api.nvim_create_autocmd('ColorScheme', {
	group = grpid,
	pattern = 'gruvbox-material',
	callback = function()
		-- ':TSHighlightCapturesUnderCursor' will tell the correct match to use for color correction.
		vim.cmd('highlight! link @module.elixir AquaBold')
		vim.cmd('highlight! link @constant Purple')
	end
})

vim.cmd.colorscheme('gruvbox-material')
