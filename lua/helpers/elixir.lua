local function extract_elixir_module_parts(full_module_name)
  assert(full_module_name)
  local tbl_17_auto = {}
  local i_18_auto = #tbl_17_auto
  for part in full_module_name:gmatch("([^%.]+)") do
    local val_19_auto = part
    if (nil ~= val_19_auto) then
      i_18_auto = (i_18_auto + 1)
      do end (tbl_17_auto)[i_18_auto] = val_19_auto
    else
    end
  end
  return tbl_17_auto
end
local function get_full_elixir_module()
  local first_line = vim.fn.getline(1)
  return first_line:match("defmodule%s+([%w_%.]+)%s+do")
end
local function current_absolute_module()
  return get_full_elixir_module()
end
local function current_local_module()
  local module_parts
  do
    local _2_ = get_full_elixir_module()
    if (nil ~= _2_) then
      module_parts = extract_elixir_module_parts(_2_)
    else
      module_parts = _2_
    end
  end
  local t_4_ = module_parts
  if (nil ~= t_4_) then
    t_4_ = (t_4_)[#module_parts]
  else
  end
  return t_4_
end
return {["current-absolute-module"] = current_absolute_module, ["current-local-module"] = current_local_module}