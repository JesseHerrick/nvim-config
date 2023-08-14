function SetColorSchema(color)
	color = color or "gruvbox-material"
	vim.cmd.colorscheme(color)
end

SetColorSchema()
