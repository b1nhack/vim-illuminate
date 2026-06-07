local M = {}

function M.get_cursor_pos(winid)
  winid = winid or vim.api.nvim_get_current_win()
  local cursor = vim.api.nvim_win_get_cursor(winid)
  cursor[1] = cursor[1] - 1 -- we always want line to be 0-indexed
  return cursor
end

function M.is_allowed(allow_list, deny_list, thing)
  if #allow_list == 0 and #deny_list == 0 then
    return true
  end

  if #deny_list > 0 then
    return not vim.tbl_contains(deny_list, thing)
  end

  return vim.tbl_contains(allow_list, thing)
end

return M
