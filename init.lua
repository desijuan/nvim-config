vim.pack.add {
  -- Cursorhold Timeout
  "https://github.com/tanchihpin0517/cursorhold-timeout.nvim",
  -- Lsp Config
  "https://github.com/j-hui/fidget.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  -- Git Signs
  "https://github.com/lewis6991/gitsigns.nvim",
  -- Autoformat
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/mcauley-penney/tidy.nvim",
  -- Colors
  "https://github.com/askfiy/visual_studio_code",
  "https://github.com/nickkadutskyi/jb.nvim",
  -- Comment
  "https://github.com/numToStr/Comment.nvim",
  -- Nvim Autopairs
  "https://github.com/windwp/nvim-autopairs",
  -- Vim Fugitive
  "https://github.com/tpope/vim-fugitive",
  -- Nvim Tree
  "https://github.com/nvim-tree/nvim-tree.lua",
  -- Lualine
  'https://github.com/nvim-lualine/lualine.nvim',
  -- Telescope
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  -- Which Key
  "https://github.com/folke/which-key.nvim",
  -- Wiki Vim
  "https://github.com/lervag/wiki.vim",
}

vim.diagnostic.config { virtual_text = true }
vim.cmd.colorscheme "visual_studio_code"

require("nvim-autopairs").setup {}

require("cursorhold-timeout").setup {
  timeout = 250, -- (milliseconds)
}

vim.lsp.enable {
  "lua_ls", "zls", "rust_analyzer",
  -- "clangd",
  "ts_ls",
}

require("conform").setup {
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

require("nvim-tree").setup {
  filters = {
    dotfiles = true,
  },
  sort = {
    sorter = "case_sensitive"
  },
}

require("lualine").setup {
  options = {
    icons_enabled = false,
    component_separators = "|",
    section_separators = "",
    disabled_filetypes = { "NvimTree" }
    -- theme = "codedark",
  }
}

require("fidget").setup {
  notification = {
    window = {
      avoid = { "NvimTree" }
    }
  }
}

require("which-key").setup {
  icons = { rules = false },
}

require "options"
require "keymaps"
require "autocommands"
require "join-operator"
-- require "statusline"
