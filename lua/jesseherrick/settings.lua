vim.g.mapleader = " "

vim.opt.clipboard = 'unnamedplus'
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.smartindent = false

vim.opt.textwidth = 120
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.colorcolumn = nil -- "120"

-- folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.cmd [[autocmd BufReadPost,FileReadPost * normal zR]]

-- autoformat
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.cmd('autocmd BufReadPost,FileReadPost * normal zR')
