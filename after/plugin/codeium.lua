# config for codeium.nvim

vim.keymap.set("i", "<C-s>",
	function()
		print("Complete")
		return vim.fn["codeium#Complete()"]
	end)
