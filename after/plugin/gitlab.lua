local gitlab = require("gitlab")

gitlab.setup({
	port = 21036, -- The port of the Go server, which runs in the background
	log_path = vim.fn.stdpath("cache") .. "/gitlab.nvim.log", -- Log path for the Go server
	reviewer = "delta", -- The reviewer type ("delta" or "diffview")
	attachment_dir = nil, -- The local directory for files (see the "summary" section)
	popup = { -- The popup for comment creation, editing, and replying
		exit = "<Esc>",
		perform_action = "<leader>s", -- Once in normal mode, does action (like saving comment or editing description, etc)
		perform_linewise_action = "<leader>l", -- Once in normal mode, does the linewise action (see logs for this job, etc)
	},
	discussion_tree = { -- The discussion tree that holds all comments
		blacklist = {}, -- List of usernames to remove from tree (bots, CI, etc)
		jump_to_file = "o", -- Jump to comment location in file
		jump_to_reviewer = "m", -- Jump to the location in the reviewer window
		edit_comment = "e", -- Edit coment
		delete_comment = "dd", -- Delete comment
		reply = "r", -- Reply to comment
		toggle_node = "t", -- Opens or closes the discussion
		toggle_resolved = "p", -- Toggles the resolved status of the discussion
		position = "left", -- "top", "right", "bottom" or "left"
		size = "20%", -- Size of split
		relative = "editor", -- Position of tree split relative to "editor" or "window"
		resolved = '✓', -- Symbol to show next to resolved discussions
		unresolved = '✖', -- Symbol to show next to unresolved discussions
	},
	review_pane = { -- Specific settings for different reviewers
		delta = {
			added_file = "", -- The symbol to show next to added files
			modified_file = "", -- The symbol to show next to modified files
			removed_file = "", -- The symbol to show next to removed files
		}
	},
	dialogue = { -- The confirmation dialogue for deleting comments
		focus_next = { "j", "<Down>", "<Tab>" },
		focus_prev = { "k", "<Up>", "<S-Tab>" },
		close = { "<Esc>" },
		submit = { "<C-c>" },
	},
	pipeline = {
		created = "",
		pending = "",
		preparing = "",
		scheduled = "",
		running = "ﰌ",
		canceled = "ﰸ",
		skipped = "ﰸ",
		success = "✓",
		failed = "",
	},
})

vim.keymap.set("n", "<leader>glr", gitlab.review)
vim.keymap.set("n", "<leader>gls", gitlab.summary)
vim.keymap.set("n", "<leader>glA", gitlab.approve)
vim.keymap.set("n", "<leader>glR", gitlab.revoke)
vim.keymap.set("n", "<leader>glc", gitlab.create_comment)
vim.keymap.set("n", "<leader>gln", gitlab.create_note)
vim.keymap.set("n", "<leader>gld", gitlab.toggle_discussions)
vim.keymap.set("n", "<leader>glaa", gitlab.add_assignee)
vim.keymap.set("n", "<leader>glad", gitlab.delete_assignee)
vim.keymap.set("n", "<leader>glra", gitlab.add_reviewer)
vim.keymap.set("n", "<leader>glrd", gitlab.delete_reviewer)
vim.keymap.set("n", "<leader>glp", gitlab.pipeline)
vim.keymap.set("n", "<leader>glo", gitlab.open_in_browser)
