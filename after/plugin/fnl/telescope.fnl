(local telescope (require "telescope"))
(local builtin (require "telescope.builtin"))
(local actions (require "telescope.actions"))
(local elixir (require "helpers.elixir"))

(vim.keymap.set "n" "<leader>pf" builtin.find_files {})
(vim.keymap.set "n" "<leader>gf" builtin.git_files)
(vim.keymap.set "n" "<leader>/" builtin.live_grep {})
(vim.keymap.set "n" "<leader>sl" (fn [] (vim.cmd "Telescope live_grep search_dirs=lib")))
(vim.keymap.set "n" "<leader>st" (fn [] (vim.cmd "Telescope live_grep search_dirs=test")))
(vim.keymap.set "n" "<leader>fj" (fn [] (vim.cmd "Telescope jump_list")))
(vim.keymap.set "n" "<leader>sm"
  (fn []
		(let [current-module (elixir.current-local-module)]
			(vim.cmd (.. "Telescope live_grep search_dirs=lib default_text=" current-module)))))
(vim.keymap.set "n" "<leader>bb" builtin.buffers {})
(vim.keymap.set "n" "<leader>fh" builtin.help_tags {})
(vim.keymap.set "n" "<leader>ft" builtin.treesitter {})

(telescope.setup
	{:defaults
		{:mappings
			{:i
				{"jk" actions.close
				 "<C-g>" actions.close
				 "<C-j>" actions.move_selection_next
				 "<C-k>" actions.move_selection_previous
				 "<C-h>" "which_key"
				 "<C-s>" (+ actions.send_selected_to_qflist actions.open_qflist)}}}}
	{:sorters ["fzy"]
	 :extensions {}
	 :pickers
		{:find_files
			{:hidden true}}})

; (vim.keymap.set "n" "<leader><leader>" (fn [] (telescope.extensions.frecency.frecency)) {:noremap true :silent true})
