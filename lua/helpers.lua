local function yank(stuff)
  if stuff then
    vim.fn.setreg("+", stuff)
    return print("Yanked:", stuff)
  else
    return print("Nothing to yank.")
  end
end
return {yank = yank}