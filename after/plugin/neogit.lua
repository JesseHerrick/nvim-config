local neogit = require('neogit')

vim.keymap.set("n", "<leader>gg", function() neogit.open() end)
-- vim.keymap.set("n", "<leader>gb", function()
-- 	neogit.
-- end)
