-- Nvim Tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Set <space> as the leader key
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Make line numbers default
vim.opt.number = true
-- Don't show the mode, since it's already in status line
vim.opt.showmode = false
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"
-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"
-- Show which line your cursor is on
vim.opt.cursorline = true

-- Enable break indent
vim.opt.breakindent = true
-- Don't save undo history
vim.opt.undofile = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- -- colorcolumn
-- vim.opt.colorcolumn = "100"

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.o.guifont = "FantasqueSansM Nerd Font:h13"
vim.opt.title = true

-- Hightlight Trailing Whitespaces
vim.fn.matchadd("Underlined", [[\s\+$]])

vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.fixendofline = false

-- lervag/wiki.vim
vim.g.wiki_root = "~/notas"
