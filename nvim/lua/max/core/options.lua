-- https://neovim.io/doc/user/options.html

local o = vim.opt

-- line numbers
o.number = true         -- show line numbers by default
o.relativenumber = true -- show relative line numbers
o.numberwidth = 8       -- line number column width

-- tabs and indentation
o.expandtab = true
o.autoindent = true
o.smartindent = true
o.tabstop = 4
o.shiftwidth = 4

-- search settings
o.ignorecase = true
o.smartcase = true

-- appearance
o.background = 'dark'
o.termguicolors = true
o.guifont = 'monospace:h17'

-- split windows
o.splitright = true
o.splitbelow = true

o.timeoutlen = 1000         -- time in milliseconds to wait for a mapped sequence to complete
o.mouse = ''                -- disable mouse support for the sake of learning Vim
o.wrap = false              -- display lines as one long line
o.clipboard = 'unnamedplus' -- use system clipboard as default register
o.iskeyword:append('-')     -- consider string-string as one word
o.scrolloff = 10            -- minimal number of screen lines to keep above and below the cursor
o.sidescrolloff = 10        -- minimal number of columns to keep to the left/right of the cursor
o.cmdheight = 2             -- number of lines to use for the command-line
o.showmode = false          -- turn off since the mode will be shown in the status line
o.lisp = false              -- turn on when writing lisp
