--- Helpers
local cmd = vim.cmd  -- To execute Vim commands e.g. cmd('pwd')
local g = vim.g      -- Access to global options (can be non-existant, e.g. a plugin's settings)
local o = vim.o      -- Access to global options (has to exist in base nvim)

--- Package Management
cmd('packadd paq-nvim')                 -- Load the package manager
local paq = require('paq-nvim').paq     -- A convenient alias
paq {'savq/paq-nvim', opt = true}       -- paq-nvim manages itself
paq {'nvim-treesitter/nvim-treesitter'} -- An awesome parser generator
paq {'nvim-treesitter/playground'}      -- Use this if you don't understand what treesitter does
paq {'neovim/nvim-lspconfig'}           -- Setup builtin lsp in latest nvim
paq {'hrsh7th/nvim-compe'}              -- Completion
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-lua/popup.nvim'}
paq {'nvim-telescope/telescope.nvim'}
paq {'vim-syntastic/syntastic'}         -- Syntax checking
paq {'rust-lang/rust.vim'}              -- Rust support
paq {'glepnir/indent-guides.nvim'}      -- Indentation guides
paq {'rafcamlet/nvim-luapad'}           -- Lua stuff
paq {'bakpakin/fennel.vim'}             -- Fennel support
paq {'glacambre/firenvim'}              -- nvim in firefox
paq {'arp242/globedit.vim'}             -- Better commands for edit, tabedit, etc, that accepts globs
paq {'rafamadriz/neon'}                 -- Colorscheme made specifically for treesitter and lsp
paq {'hoob3rt/lualine.nvim'}            -- A fast statusline
paq {'jghauser/mkdir.nvim'}             -- Automatically make parent directories if non-existant when saving files

--- indent-guides
require 'indent_guides'.setup {}

--- LSP
local lsp = require 'lspconfig'
lsp.bashls.setup {} -- bash
lsp.denols.setup {} -- javascript and typescript

-- fsharp - start
-- these file extensions default to forth, set to fsharp instead
cmd('autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi set filetype=fsharp')
lsp.fsautocomplete.setup {
    cmd = {'fsautocomplete', '--background-service-enabled'}
}
-- fsharp - end

lsp.intelephense.setup {} -- php
lsp.rust_analyzer.setup {} -- rust

-- lua - start
local sumneko_root_path = '/home/valley/downloads/git/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
-- lua - end

lsp.pyls.setup{} -- python

--- lualine
local lualine = require 'lualine'
lualine.setup {
    options = {
        icons_enabled = false,
        theme = 'neon',
        component_separators = {'', ''},
        section_separators = {'', ''},
        disabled_filetypes = {},
        lower = true
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}

-- mkdir.nvim
require 'mkdir'

--- nvim-compe
local compe = require 'compe'
o.completeopt = 'menuone,noselect'
compe.setup {
    enabled = true;
    autocomplete = true; -- Note: this does NOT mean auto-complete, it means tab-complete
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        treesitter = true;
    };
}

--- nvim-luapad
cmd('command Lev execute "lua require \'luapad/run\'.run()"')

--- Syntastic
g.syntastic_always_populate_loc_list = 1
g.syntastic_auto_loc_list = 1
g.syntastic_check_on_open = 1
g.syntastic_check_on_wq = 0

--- Telescope
local telescope = require 'telescope'
telescope.setup {}

--- Treesitter
local ts = require 'nvim-treesitter.configs'
ts.setup {
    ensure_installed = 'maintained',
    highlight = {
        enable = true
    }
}
