--- Helpers
local cmd = vim.cmd      -- To execute Vim commands e.g. cmd('pwd')
local g = vim.opt_global -- Acces to global options (must exist)
local G = vim.g          -- Access to global options (can be non-existant, e.g. a plugin's settings)
local o = vim.opt_local  -- Access to local options (must exist)

--- Settings
-- Expand tabs into spaces
o.expandtab = true
local indent, width = 4, 100
-- Set size of indent to 4
o.shiftwidth = indent
-- Insert indents automatically
o.smartindent = true
-- Tabs = 4 spaces
o.tabstop = indent
-- Completion options required for compe
g.completeopt = 'menuone,noselect'
g.guifont = "Envy Code R"
-- Enable mouse support
g.mouse = 'a'
-- Put new windows below current
g.splitbelow = true
-- Put new windows to the right of the current
g.splitright = true
-- Enable truecolor suppor
g.termguicolors = true
-- Username for collaborative editing
G.instant_username = "Phate6660"
-- Use the dark variant of the neon colorscheme
G.neon_style = "doom" -- Supported options: 'normal', 'doom', 'dark', 'light'
G.neon_transparent = true
-- Syntastic options
G.syntastic_always_populate_loc_list = 1
G.syntastic_auto_loc_list = 1
G.syntastic_check_on_open = 1
G.syntastic_check_on_wq = 0
G.syntastic_enable_racket_racket_checker = 1
-- Color the 100th column of text
o.colorcolumn = tostring(width)
-- Highlight the current line the cursor is on
o.cursorline = true
-- Show line numbers
o.number = true
-- Show relative line numbers
o.relativenumber = true
-- DIsable line wrapping
o.wrap = false

-- Set the colorscheme to neon (installed through paq)
cmd('colorscheme neon')
-- 2 space indentation for CSS, HTML, and XML
cmd('autocmd Filetype css setlocal sw=2 ts=2')
cmd('autocmd Filetype html setlocal sw=2 ts=2')
cmd('autocmd Filetype xml setlocal sw=2 ts=2')
-- Set these filetypes to fsharp
cmd('autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi set filetype=fsharp')
