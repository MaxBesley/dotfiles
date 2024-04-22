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
keymap('n', '<Esc>', '<Cmd>w<CR>', opts)

-- navigate horizontally more easily
keymap('n', 'L', '$', opts)
keymap('n', 'H', '^', opts)

-- cursor doesn't move when joining lines
keymap('n', 'J', "mzJ`z", opts)

-- next/prev cursor position
keymap('n', '<C-i>', '<C-i>zz', opts)
keymap('n', '<C-o>', '<C-o>zz', opts)

-- navigate vertically by 1/2 page
keymap('n', '<C-u>', '<C-u>zz', opts)
keymap('n', '<C-d>', '<C-d>zz', opts)

-- keep screen centred during "/" searching
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

-- search for word under the cursor
keymap('n', '*', '*zz', opts)
keymap('n', '#', '#zz', opts)

-- don't copy deleted single characters
keymap('n', 'x', '"_x', opts)

-- use leader key to yank into system clipboard
keymap('n', '<leader>y', "\"+y", opts)
keymap('v', '<leader>Y', "\"+y", opts)
keymap('n', '<leader>Y', "\"+Y", opts)

-- clear search highlights
keymap('n', '<leader>nh', ':nohl<CR>', opts)

-- substitute the word currently under the cursor
keymap('n', '<leader>su', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- surround a word in double quotes
keymap('n', "<leader>\"", "viw<esc>a\"<esc>bi\"<esc>lel", opts)

-- easily add newlines
keymap('n', '<leader>o', 'o<Esc>', opts)
keymap('n', '<leader>O', 'O<Esc>', opts)

-- visually select all text
keymap('n', '<C-a>' ,'G$vgg0', opts)

-- split window management
keymap('n', '<leader>sv', '<C-w>v', opts) -- split window vertically
keymap('n', '<leader>sh', '<C-w>s', opts) -- split window horizontally
keymap('n', '<leader>s=', '<C-w>=', opts) -- make split windows equal width & height
keymap('n', '<leader>sx', '<Cmd>close<CR>', opts) -- close current split

-- split window navigation
keymap('n', '<leader>h', '<C-w>h', opts)
keymap('n', '<leader>j', '<C-w>j', opts)
keymap('n', '<leader>k', '<C-w>k', opts)
keymap('n', '<leader>l', '<C-w>l', opts)

-- resize split windows using arrow keys
keymap('n', '<C-Up>', ':resize +3<CR>', opts)
keymap('n', '<C-Down>', ':resize -1<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize +3<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize -1<CR>', opts)

-- navigate buffers
keymap('n', '<Tab>', '<Cmd>bnext<CR>', opts)
keymap('n', '<S-Tab>', '<Cmd>bprevious<CR>', opts)
keymap('n', '<leader>x', '<Cmd>bdelete<CR>', opts)


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
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)
-- for pasting over text with "p"
keymap('v', 'p', '"_dP', opts)
-- just exit visual mode by pressing "v" again
keymap('v', '<ESC>', '<Nop>', opts)
keymap('v', '<C-c>', '<Nop>', opts)
-- surround with double quotes???
--keymap("v", "<leader>\"", ":s/\%V\(.*\)\%V/"\1"/", opts)


--- VISUAL BLOCK ---


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




--keymap('n', '<leader>to', '<Cmd>tabnew<CR>', { desc = 'Open new tab' })
--keymap('n', '<leader>tx', '<Cmd>tabclose<CR>', { desc = 'Close current tab' })
--keymap('n', '<leader>tn', '<Cmd>tabn<CR>', { desc = 'Go to next tab' })
--keymap('n', '<leader>tp', '<Cmd>tabp<CR>', { desc = 'Go to previous tab' })
--keymap('n', '<leader>tf', '<Cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

