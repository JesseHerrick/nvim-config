function SetColorSchema(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)
end

SetColorSchema()
