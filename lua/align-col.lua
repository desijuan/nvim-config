vim.api.nvim_create_user_command('AlignCol', function(opts)
  local sep = opts.args
  local cmd = string.format(
    ":'<,'>!sed 's/ %s /\\t/' | column -t -s $'\\t' -o ' %s '",
    sep, sep
  )
  vim.cmd(cmd)
end, { range = true, nargs = 1 })

vim.keymap.set('v', '<leader>ac', function()
  local sep = vim.fn.input('Separator: ')
  if sep == '' then return end
  vim.cmd('AlignCol ' .. sep)
end)
