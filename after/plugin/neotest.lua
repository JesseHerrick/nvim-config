require("neotest").setup({
	adapters = {
		require("neotest-elixir")
	},
	status = {
		enabled = false
	}
})

vim.keymap.set("n", "tl", function() require("neotest").run.run() end)
vim.keymap.set("n", "tf", function() require("neotest").run.run(vim.fn.expand("%")) end)
vim.keymap.set("n", "tq", function() require("neotest").run.stop() end)
