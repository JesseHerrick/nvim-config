local util = require("formatter.util")

require("formatter").setup {
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		javascript = {
			require("formatter/defaults/prettier")
		},
		typescript = {
			require("formatter/defaults/prettier")
		},
		typescriptreact = {
			require("formatter/defaults/prettier")
		}
	}
}

-- autocmd / augroup
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		vim.cmd("FormatWrite")
	end
})

-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost * FormatWrite
-- augroup END
