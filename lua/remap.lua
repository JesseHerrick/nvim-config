local _local_1_ = require("helpers")
local yank = _local_1_["yank"]
local current_file_and_line = _local_1_["current-file-and-line"]
local elixir = require("helpers.elixir")
vim.keymap.set("x", "<C-g>", "<Esc>")
vim.keymap.set({"n", "i", "v"}, "<C-g>", "<Esc>", {noremap = true})
vim.keymap.set("i", "jk", "<Esc>", {noremap = true})
vim.keymap.set("n", "<leader>fs", vim.cmd.w)
vim.keymap.set("n", "<leader>1", "<C-w>h")
vim.keymap.set("n", "<leader>2", "<C-w>l")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>|", vim.cmd.vsplit)
local function _2_()
  return vim.cmd("tabNext")
end
vim.keymap.set("n", "<C-Tab>", _2_)
local function _3_()
  return vim.cmd("copen")
end
vim.keymap.set("n", "<leader>'", _3_)
local function _4_()
  vim.cmd("cnext")
  return "zz"
end
vim.keymap.set("n", "<leader>cn", _4_)
local function _5_()
  vim.cmd("cprev")
  return "zz"
end
vim.keymap.set("n", "<leader>cp", _5_)
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", "\"_dP")
local function _6_()
  return yank(elixir["current-local-module"]())
end
vim.keymap.set("n", "<leader>ym", _6_)
local function _7_()
  return yank(elixir["current-absolute-module"]())
end
vim.keymap.set("n", "<leader>yM", _7_)
local function _8_()
  return elixir["run-elixir-test"](current_file_and_line())
end
vim.keymap.set("n", "<leader>ft", _8_)
local function _9_()
  return yank(vim.fn.expand("%"))
end
vim.keymap.set("n", "<leader>yF", _9_)
local function _10_()
  return yank(current_file_and_line())
end
return vim.keymap.set("n", "<leader>yf", _10_)