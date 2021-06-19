--- Helpers
local b = vim.bo     -- Access to buffer-local options
local cmd = vim.cmd  -- To execute Vim commands e.g. cmd('pwd')
local g = vim.g      -- Access to global options (can be non-existant, e.g. a plugin's settings)
local o = vim.o      -- Access to global options (has to exist in base nvim)
local w = vim.wo     -- Access to window-local options

--- Settings
cmd('set expandtab')            -- Expand tabs into spaces

local indent, width = 4, 100
b.shiftwidth = indent           -- Size of an indent
b.smartindent = true            -- Insert indents automatically
b.tabstop = indent              -- Number of spaces tabs count for
g.neon_style = "dark"
o.mouse = 'a'                   -- Enable mouse support
o.splitbelow = true             -- Put new windows below current
o.splitright = true             -- Put new windows right of current
o.termguicolors = true          -- True color support
w.colorcolumn = tostring(width) -- Line length marker
w.cursorline = true             -- Highlight cursor line
w.number = true                 -- Print line number
w.relativenumber = true         -- Relative line numbers
w.wrap = false                  -- Disable line wrap

cmd('colorscheme neon')         -- Set the colorscheme
cmd('autocmd Filetype css setlocal sw=2 ts=2')  -- 2 space indentation for CSS
cmd('autocmd Filetype html setlocal sw=2 ts=2') -- 2 space indentation for HTML
cmd('autocmd Filetype xml setlocal sw=2 ts=2')  -- 2 space indentation for XML
