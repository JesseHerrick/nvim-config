(let [neogit (require :neogit)]
	(vim.keymap.set "n" "<leader>gg" (fn [] (neogit.open))))
