local function mode()
  local curr_mode = vim.fn.mode()
  local mode_map = {
    n = "N",
    i = "I",
    v = "V",
    V = "V-LINE",
    ["\22"] = "V-BLOCK",
    c = "C",
    r = "R",
    t = "T",
  }
  return mode_map[curr_mode] or curr_mode
end

local function git()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then
    return ""
  end

  local head    = git_info.head
  local added   = git_info.added and (" +" .. git_info.added) or ""
  local changed = git_info.changed and (" ~" .. git_info.changed) or ""
  local removed = git_info.removed and (" -" .. git_info.removed) or ""
  if git_info.added == 0 then added = "" end
  if git_info.changed == 0 then changed = "" end
  if git_info.removed == 0 then removed = "" end

  return table.concat({
    " [ ", -- branch icon
    head,
    added, changed, removed,
    "]",
  })
end

local function get_value(option, winid)
  return vim.api.nvim_get_option_value(option, {
    buf = vim.api.nvim_win_get_buf(winid),
  })
end

local function filetype(winid)
  return get_value("filetype", winid)
end

local function modified(winid)
  return get_value("modified", winid) and " [+]" or ""
end

Statusline = {}

function Statusline.active()
  local winid = vim.g.statusline_winid

  if "NvimTree" == filetype(winid) then
    return ""
  end

  return table.concat {
    " %f",
    modified(winid),
    git(),
    " ",
    mode(),
    "%=%y %P %l:%c ",
  }
end

function Statusline.inactive()
  local winid = vim.g.statusline_winid

  if "NvimTree" == filetype(winid) then
    return ""
  end

  return " %t"
end

local statusline_group = vim.api.nvim_create_augroup("Statusline", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  group = statusline_group,
  desc = "Activate statusline on focus",
  callback = function()
    vim.opt_local.statusline = "%!v:lua.Statusline.active()"
  end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  group = statusline_group,
  desc = "Deactivate statusline when unfocused",
  callback = function()
    vim.opt_local.statusline = "%!v:lua.Statusline.inactive()"
  end,
})

vim.api.nvim_create_autocmd("User", {
  group = statusline_group,
  pattern = "GitSignsUpdate",
  callback = function()
    vim.cmd("redrawstatus")
  end,
})
