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
local function elixir_current_module()
  local first_line = vim.fn.getline(1)
  return first_line:match("defmodule%s+([%w_%.]+)%s+do")
end

local function elixir_current_local_module()
  local full = elixir_current_module()
  if not full then return nil end
  local parts = {}
  for part in full:gmatch("([^%.]+)") do
    table.insert(parts, part)
  end
  return parts[#parts]
end

return {
  yank = yank,
  ["current-file-and-line"] = current_file_and_line,
  ["elixir-current-module"] = elixir_current_module,
  ["elixir-current-local-module"] = elixir_current_local_module,
}