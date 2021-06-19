--- Helpers
local cmd = vim.cmd  -- To execute Vim commands e.g. cmd('pwd')
local CONFIG_PATH = '/home/valley/.config/nvim'

--- Load lua files
cmd('luafile '..CONFIG_PATH..'/packages.lua')
cmd('luafile '..CONFIG_PATH..'/settings.lua')
cmd('luafile '..CONFIG_PATH..'/cak.lua') -- commands and keybindings
