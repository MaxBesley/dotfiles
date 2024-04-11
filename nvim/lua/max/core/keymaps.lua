local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',


-- remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- disable arrow keys
keymap('n', '<Up>', '<Nop>', opts)
keymap('n', '<Down>', '<Nop>', opts)
keymap('n', '<Left>', '<Nop>', opts)
keymap('n', '<Right>', '<Nop>', opts)
keymap('i', '<Up>', '<Nop>', opts)
keymap('i', '<Down>', '<Nop>', opts)
keymap('i', '<Left>', '<Nop>', opts)
keymap('i', '<Right>', '<Nop>', opts)


--- NORMAL ---
-- save the file
keymap('n', '<Esc>', '<Cmd>w<Cr>', opts)

-- next/prev cursor position
keymap('n', '<C-i>', '<C-i>zz', opts)
keymap('n', '<C-o>', '<C-o>zz', opts)

-- navigate vertically by 1/2 page
keymap('n', '<C-u>', '<C-u>zz', opts)
keymap('n', '<C-d>', '<C-d>zz', opts)

-- navigate horizontally more easily
keymap('n', 'L', '$', opts)
keymap('n', 'H', '^', opts)

-- keep screen centred during "/" searching
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

-- search for word under the cursor
keymap('n', '*', '*zz', opts)
keymap('n', '#', '#zz', opts)

-- don't copy deleted single characters
keymap('n', 'x', '"_x', opts)

-- clear search highlights
keymap('n', '<leader>nh', ':nohl<CR>', opts)

-- surround a word in double quotes
keymap('n', "<leader>\"", "viw<esc>a\"<esc>bi\"<esc>lel", opts)

-- easily add newlines
keymap('n', '<leader>o', 'o<Esc>', opts)
keymap('n', '<leader>O', 'O<Esc>', opts)

-- visually select all text
keymap('n', '<C-a>' ,'G$vgg0', opts)

-- better window navigation
keymap('n', '<C-h>', '<C-w>h', opts) -- or use '<leader>h' instead?
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- resize windows with arrow keys
--keymap("n", "<C-Up>", ":resize +3<CR>", opts)
--keymap("n", "<C-Down>", ":resize -1<CR>", opts)
--keymap("n", "<C-Left>", ":vertical resize -1<CR>", opts)
--keymap("n", "<C-Right>", ":vertical resize +3<CR>", opts)

-- navigate buffers
--keymap("n", "<S-l>", ":bnext<CR>", opts)
--keymap("n", "<S-h>", ":bprevious<CR>", opts)


--- INSERT ---
-- mash these to leave insert mode
keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'kj', '<ESC>', opts)
-- nullify pressing escape
keymap('i', '<ESC>', '<Nop>', opts)


--- VISUAL ---
-- for indenting text
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)
-- move text up and down
keymap('v', '<A-j>', ':m .+2<CR>==', opts)
keymap('v', '<A-k>', ':m .-1<CR>==', opts)
-- for pasting over text with "p"
keymap('v', 'p', '"_dP', opts)
-- just exit visual mode by pressing "v" again
keymap('v', '<ESC>', '<Nop>', opts)
keymap('v', '<C-c>', '<Nop>', opts)
-- surround with double quotes???
--keymap("v", "<leader>\"", ":s/\%V\(.*\)\%V/"\1"/", opts)


--- VISUAL BLOCK ---
-- like above
keymap('x', '<A-j>', ":move '>+2<CR>gv-gv", opts)
keymap('x', '<A-k>', ":move '<-1<CR>gv-gv", opts)


--- TERMINAL ---
-- better terminal navigation
--keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', term_opts)
--keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', term_opts)
--keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', term_opts)
--keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', term_opts)



-- just as a fun experiment
--keymap('n', '<Esc>', 'j<Esc>', { noremap = false })


-- where should I put this???
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    pattern = {'*'},
    callback = function()
        local save_cursor = vim.fn.getpos('.')
        pcall(function() vim.cmd [[%s/\s\+$//e]] end)
        vim.fn.setpos('.', save_cursor)
    end,
})


