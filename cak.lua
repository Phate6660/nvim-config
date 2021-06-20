--- Helpers
local cmd = vim.cmd  -- To execute Vim commands e.g. cmd('pwd')
local set_keymap = vim.api.nvim_set_keymap -- To set keybindings

-- Commands
-- :Lev will evaluate Lua code in the current buffer
-- :Sin2 will set the indentation to 2
-- :Sin4 will set the indentation to 4
cmd('command Lev execute "lua require \'luapad/run\'.run()"')
cmd('command Sin2 execute "set ts=2 sw=2"')
cmd('command Sin4 execute "set ts=4 sw=4"')

--- Keybindings
-- Anatomy of setting the keymap:
-- set_keymap(
--     'n',                          -- the mode goes here, available options are:
--                                      'c' (command-line), 'i' (insert), 'n' (normal),
--                                      'o', (operator pending), 's' (select), 't' (terminal),
--                                      'v' (visual and select), 'x' (visual)
--     '<leader>f',                  -- the keybinding goes here
--     [[<cmd>lua print('hi')<cr>]], -- what is done goes here
--     -- Options go below here inside curley brackets, such as:
--     {
--         noremap = true,
--         silent = true
--     }
-- )

-- \ + F = find and preview files
set_keymap(
    'n',
    '<leader>f',
    [[<cmd>lua require('telescope.builtin').find_files()<cr>]],
    {
        noremap = true,
        silent = true
    }
)

-- \ + T = toggle a floating terminal
set_keymap(
    'n',
    '<leader>t',
    [[<cmd>lua require('FTerm').toggle()<cr>]],
    {
        noremap = true,
        silent = true
    }
)

set_keymap(
    't',
    '<leader>t',
    [[<cmd>lua require('FTerm').toggle()<cr>]],
    {
        noremap = true,
        silent = true
    }
)

-- \ + space = find and preview buffers
set_keymap(
    'n',
    '<leader><space>',
    [[<cmd>lua require('telescope.builtin').buffers()<cr>]],
    {
        noremap = true,
        silent = true
    }
)
