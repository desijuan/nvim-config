vim.api.nvim_create_autocmd("FileType", {
  pattern = "vala",
  callback = function()
    vim.treesitter.start()
  end,
})
