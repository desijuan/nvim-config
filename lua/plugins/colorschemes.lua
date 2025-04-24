return {
  {
    "askfiy/visual_studio_code",
    priority = 1000,
    -- init = function()
    --   vim.cmd.colorscheme "visual_studio_code"
    -- end,
  },
  {
    "nickkadutskyi/jb.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- require("jb").setup { transparent = true }
      vim.cmd "colorscheme jb"
    end,
  },
}
