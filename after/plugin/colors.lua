function SetColorSchema(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	vim.opt.termguicolors = true
end

SetColorSchema()
