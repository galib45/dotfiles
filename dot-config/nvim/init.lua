vim.g.mapleader = " "							-- sets leader key
vim.g.netrw_banner = 0						-- gets rid of the annoying banner for netrw
vim.g.netrw_browse_split = 4			-- open in prior window
vim.g.netrw_altv = 1							-- change from left splitting to right splitting
vim.g.netrw_liststyle=3						-- tree style view in netrw
vim.opt.title = true							-- show title
vim.cmd('set path+=**')						-- search current directory recursively
vim.opt.syntax = "ON"
vim.opt.backup = false
vim.opt.compatible = false				-- turn off vi compatibility mode
vim.opt.number = true							-- turn on line numbers
vim.opt.relativenumber = true			-- turn on relative line numbers
vim.opt.mouse = 'a'								-- enable the mouse in all modes
vim.opt.ignorecase = true					-- enable case insensitive searching
vim.opt.smartcase = true					-- all searches are case insensitive unless there's a capital letter
vim.opt.hlsearch = false					-- disable all highlighted search results
vim.opt.incsearch = true					-- enable incremental searching
vim.opt.wrap = false
vim.opt.tabstop = 2								-- tab = 2 spaces
vim.opt.shiftwidth = 2						-- autoindent 2 spaces
vim.opt.fileencoding = "utf-8"		-- encoding set to utf-8
vim.opt.pumheight = 10						-- number of items in popup menu
vim.opt.showtabline = 1						-- always show the tab line
vim.opt.laststatus = 2						-- always show statusline
vim.opt.signcolumn = "auto"
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.scrolloff = 6							-- scroll page when cursor is 8 lines from top/bottom
vim.opt.sidescrolloff = 6					-- scroll page when cursor is 8 spaces from left/right
vim.opt.clipboard = "unnamedplus" -- Use system clipboard and sync with unnamed register
vim.opt.termguicolors = true			-- Enable true color support
vim.cmd('colorscheme gruvbox')		-- set colorscheme
vim.cmd('filetype plugin on')			-- set filetype 
vim.cmd('set wildmenu')						-- enable wildmenu

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- reload config
configdir = "$LOCALAPPDATA"
map("n", "<leader>r", ":source "..configdir.."/nvim/init.lua<CR>")	

-- normal mode keymaps
map("n", "<leader>e", ":25Lex<CR>")	-- space+e toggles netrw tree view in 25% split
map("n", "<C-s>", ":w<CR>")					-- ctrl+s saves the file
map("n", "<Tab>", "i<C-t><Esc>")		-- indent one step
map("n", "<S-Tab>", "i<C-d><Esc>")	-- remove indent one step
map("n", "<leader>qq", ":q!<CR>")		-- quit nvim
map("n", "<leader>bd", ":bd!<CR>") 			-- delete current buffer 

-- insert mode keymaps
map("i", "<C-s>", "<Esc>:w<CR>")				-- ctrl+s goes to normal mode and saves the file
map("i", "<S-Tab>", "i<C-d><Esc>")			-- remove indent one step

-- Automatically close brackets, parethesis, and quotes
map("i", "'", "''<left>")
map("i", "\"", "\"\"<left>")
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "{;", "{};<left><left>")
map("i", "/*", "/**/<left><left>")

-- Visual mode keymaps
