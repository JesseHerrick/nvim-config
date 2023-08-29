vim.keymap.set("n", "<leader>gg", function() vim.cmd("tab Git") end)
vim.keymap.set("n", "<leader>gb", function()
	vim.cmd("Git blame")
end)
