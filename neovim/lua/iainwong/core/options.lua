vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- nvim line numbering
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2       -- 2 space tabs
opt.shiftwidth = 2    -- 2 space indent
opt.expandtab = true  -- replace tab with spaces
opt.autoindent = true -- copy indent for current line

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case during search
opt.smartcase  = true -- if mixed search case sensitive

-- turn on termguicolors for colorscheme
-- use with true color terminal
opt.termguicolors = true
opt.background = "dark" -- use dark color themes
opt.signcolumn = "yes"  -- show sign colum so text doesn't shift?

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
