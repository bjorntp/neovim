-- Space as leader key
vim.g.mapleader = ' '
vim.g.mapllocalleader = ' '

-- Set tab width to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Use line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Use system clip board
vim.opt.clipboard = 'unnamedplus'

-- Nowrap
vim.opt.wrap = false

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Ignore case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show which line your cursor is one
vim.opt.cursorline = true

-- Minimal number of screen lines under your cursor
vim.opt.scrolloff = 10

vim.g.have_nerd_font = true

vim.opt.showtabline = 2

-- Conceallevel
vim.opt.conceallevel = 2

vim.opt.swapfile = false

vim.lsp.inlay_hint.enable(true)

vim.opt.termguicolors = true
