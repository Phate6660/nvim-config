-- Load paq
vim.cmd('packadd paq-nvim')

-- The list of packages, each one is a repo
require('paq-nvim') {
    'savq/paq-nvim';                   -- paq manages itself
    'nvim-treesitter/nvim-treesitter'; -- An awesome parser generator
    'nvim-treesitter/playground';      -- Use this if you don't understand what treesitter does
    'neovim/nvim-lspconfig';           -- Setup builtin lsp in latest nvim
    'hrsh7th/nvim-compe';              -- Completion
    'nvim-lua/plenary.nvim';
    'nvim-lua/popup.nvim';
    'nvim-telescope/telescope.nvim';
    'vim-syntastic/syntastic';         -- Syntax checking
    'rust-lang/rust.vim';              -- Rust support
    'glepnir/indent-guides.nvim';      -- Indentation guides
    'rafcamlet/nvim-luapad';           -- Lua stuff
    'bakpakin/fennel.vim';             -- Fennel support
    'glacambre/firenvim';              -- nvim in firefox
    'arp242/globedit.vim';             -- Better commands for edit, tabedit, etc, that accepts globs
    'rafamadriz/neon';                 -- Colorscheme made specifically for treesitter and lsp
    'hoob3rt/lualine.nvim';            -- A fast statusline
    'jghauser/mkdir.nvim';             -- Automatically make parent directories if non-existant when saving files
    'numtostr/FTerm.nvim';             -- Awesome floating terminal for nvim
    'wlangstroth/vim-racket';          -- Racket stuff
}

--- FTerm
require 'FTerm'.setup({
    cmd = 'bash', -- the best shell, fight me ^_^
    border = 'double'
})

--- indent-guides
require 'indent_guides'.setup {}

--- LSP
local lsp = require 'lspconfig'
lsp.bashls.setup {} -- bash
lsp.denols.setup {} -- javascript and typescript

-- fsharp - start
-- these file extensions default to forth, set to fsharp instead
lsp.fsautocomplete.setup {
    cmd = {'fsautocomplete', '--background-service-enabled'}
}
-- fsharp - end

lsp.intelephense.setup {} -- php
lsp.rls.setup {} -- rust

-- lua - start
local sumneko_root_path = '/home/valley/downloads/git/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

lsp.sumneko_lua.setup {
    cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'};
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

lsp.pyls.setup {} -- python

--- lualine
require 'lualine'.setup {
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
require 'compe'.setup {
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

--- Telescope
require 'telescope'.setup {}

--- Treesitter
require 'nvim-treesitter.configs'.setup {
    ensure_installed = 'maintained',
    highlight = {
        enable = true
    }
}

