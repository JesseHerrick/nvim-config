(let [neogit (require :neogit)]
	(vim.keymap.set "n" "<leader>gb" (fn [] (neogit.open))))
