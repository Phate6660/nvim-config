--- Helpers
local cmd = vim.cmd  -- To execute Vim commands e.g. cmd('pwd')

-- Commands
-- :Sin2 will set the indentation to 2 and expand tabs to spaces
-- :Sin4 will set the indentation to 4 and expand tabs to spaces
cmd('command Sin2 execute "set ts=2 sw=2 expandtab"')
cmd('command Sin4 execute "set ts=4 sw=4 expandtab"')

--- Keybindings
-- \ + F = find and preview files
vim.api.nvim_set_keymap(
'n',
'<leader>f',
[[<cmd>lua require('telescope.builtin').find_files()<cr>]],
{
    noremap = true,
    silent = true
}
)

-- \ + space = find and preview buffers
vim.api.nvim_set_keymap(
'n',
'<leader><space>',
[[<cmd>lua require('telescope.builtin').buffers()<cr>]],
{
    noremap = true,
    silent = true
}
)
