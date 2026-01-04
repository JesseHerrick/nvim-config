local function yank(stuff)
  if stuff then
    vim.fn.setreg("+", stuff)
    return print("Yanked:", stuff)
  else
    return print("Nothing to yank.")
  end
end
local function current_file_and_line()
  local current_file = vim.fn.expand("%")
  local current_line = vim.fn.line(".")
  return (current_file .. ":" .. current_line)
end
return {yank = yank, ["current-file-and-line"] = current_file_and_line}