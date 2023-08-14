local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
	-- close telescope with jk
	["jk"] = actions.close,
	["<C-g>"] = actions.close
      }
    }
  }
})
