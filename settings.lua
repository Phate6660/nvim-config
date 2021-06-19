--- Helpers
local b = vim.bo     -- Access to buffer-local options
local cmd = vim.cmd  -- To execute Vim commands e.g. cmd('pwd')
local g = vim.g      -- Access to global options (can be non-existant, e.g. a plugin's settings)
local o = vim.o      -- Access to global options (has to exist in base nvim)
local w = vim.wo     -- Access to window-local options

--- Settings
-- Expand tabs into spaces
cmd('set expandtab')
local indent, width = 4, 100
-- Set size of indent to 4
b.shiftwidth = indent
-- Insert indents automatically
b.smartindent = true
-- Tabs = 4 spaces
b.tabstop = indent
-- Use the dark variant of the neon colorscheme
g.neon_style = "dark" -- Supported options: 'normal', 'doom', 'dark', 'light'
-- Enable mouse support
o.mouse = 'a'
-- Put new windows below current
o.splitbelow = true
-- Put new windows to the right of the current
o.splitright = true
-- Enable truecolor suppor
o.termguicolors = true
-- Color the 100th column of text
w.colorcolumn = tostring(width)
-- Highlight the current line the cursor is on
w.cursorline = true
-- Show line numbers
w.number = true
-- Show relative line numbers
w.relativenumber = true
-- DIsable line wrapping
w.wrap = false

-- Set the colorscheme to neon (installed through paq)
cmd('colorscheme neon')
-- 2 space indentation for CSS, HTML, and XML
cmd('autocmd Filetype css setlocal sw=2 ts=2')
cmd('autocmd Filetype html setlocal sw=2 ts=2')
cmd('autocmd Filetype xml setlocal sw=2 ts=2')
