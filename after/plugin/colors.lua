function SetColorSchema(color)
	color = color or "gruvbox-material"
end

vim.g.gruvbox_material_foreground = 'mix'
vim.g.gruvbox_material_background = 'hard'

local grpid = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {})

vim.api.nvim_create_autocmd('ColorScheme', {
	group = grpid,
	pattern = 'gruvbox-material',
	callback = function()
		local function hl_lnk(src, trgt)
			vim.api.nvim_set_hl(0, src, { link = trgt })
		end

		-- see: https://github.com/sainnhe/gruvbox-material/blob/master/colors/gruvbox-material.vim
		hl_lnk('@symbol.elixir', 'Yellow')
		hl_lnk('@constant.elixir', 'Aqua')
	end
})

vim.cmd.colorscheme('gruvbox-material')
