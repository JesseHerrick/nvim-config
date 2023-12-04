require('orgmode').setup_ts_grammar()

-- Setup treesitter
require('nvim-treesitter.configs').setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { 'org' },
	},
	ensure_installed = { 'org' },
})

-- Setup orgmode
require('orgmode').setup({
	org_agenda_files = '~/notes/**/*',
	org_default_notes_file = '~/notes/todo.org',
})
