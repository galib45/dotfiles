-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Make line numbers default
vim.opt.number = true
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = 'unnamedplus'
-- Enable break indent
vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Show which line your cursor is on
vim.opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.cmd('nohlsearch')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local function get_plugin_name(repo)
  -- Split the repository URL by '/'
  local parts = {}
  for part in repo:gmatch("[^/]+") do
    table.insert(parts, part)
  end
  -- Extract the last part (plugin name)
  local name = parts[#parts]
  return name
end

-- Check if the operating system is Windows
local is_windows = vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1

local function install_plugin(repo)
  local name = get_plugin_name(repo)
  -- set the path separator acc to OS
  local path_separator = '/'
  if is_windows then path_separator = '\\' end
  -- join plugin name with neovim data path
  local path = vim.fn.stdpath('data') .. path_separator .. name
  if not vim.loop.fs_stat(path) then
    -- create complete repo url
    repo = 'https://github.com/' .. repo
    local success = vim.fn.system { 'git', 'clone', repo, path }
    print(success)
  end
  -- add plugin directory to neovim runtime path
  vim.opt.rtp:prepend(path)
end

-- install plugins
install_plugin('tpope/vim-sleuth')
install_plugin('numToStr/Comment.nvim')
install_plugin('echasnovski/mini.pairs')
install_plugin('echasnovski/mini.statusline')
install_plugin('folke/tokyonight.nvim')
install_plugin('nvim-treesitter/nvim-treesitter')
install_plugin('stevearc/oil.nvim')

-- set the coloscheme
vim.cmd('colorscheme tokyonight-night')

-- setup comment
require('Comment').setup()

-- setup autopairs
require('mini.pairs').setup()

-- setup the statusline
local statusline = require 'mini.statusline'
statusline.setup { use_icons = false }
statusline.section_location = function()
  return '%2l:%-2v'
end

-- setup treesitter
require('nvim-treesitter.configs').setup({
  auto_install = true,
  highlight = { enable = true },
})

-- setup oil
require("oil").setup()

-- key mappings
-- general
vim.keymap.set('n', '<C-s>', '<CMD>w<CR>')
vim.keymap.set('i', '<C-s>', '<ESC><cmd>w<CR>')
vim.keymap.set('n', '<C-q>', '<CMD>q<CR>')
vim.keymap.set('n', '<leader>cs', '<CMD>source %<CR>')
-- oil
vim.keymap.set('n', '-', '<CMD>Oil<CR>')
vim.keymap.set('n', '<leader>n', '<CMD>Oil '..vim.fn.stdpath('config')..'<CR>')
-- buffer manipulation
vim.keymap.set('n', '<leader>bp', '<CMD>bp<CR>')
vim.keymap.set('n', '<leader>bn', '<CMD>bn<CR>')
vim.keymap.set('n', '<leader>bd', '<CMD>bd<CR>')
