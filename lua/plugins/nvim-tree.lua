return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup {
      view = {
        width = 35,
      },
    }
    local api = require "nvim-tree.api"
    vim.keymap.set("n", "<leader>t", api.tree.toggle, { desc = "NvimTreeToggle" })
  end,
}
