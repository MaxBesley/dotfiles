return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'BurntSushi/ripgrep',
        'sharkdp/fd',
    },

    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')

        telescope.setup {
            defaults = {
                path_display = { 'smart' },
                mappings = {
                    i = { -- insert mode
                        ['<C-n>'] = actions.cycle_history_next,
                        ['<C-p>'] = actions.cycle_history_prev,

                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,

                        ['<C-c>'] = actions.close,

                        ['<Down>'] = actions.move_selection_next,
                        ['<Up>'] = actions.move_selection_previous,

                        ['<CR>'] = actions.select_default,
                        ['<C-x>'] = actions.select_horizontal,
                        ['<C-v>'] = actions.select_vertical,
                        ['<C-t>'] = actions.select_tab,

                        ['<C-u>'] = actions.preview_scrolling_up,
                        ['<C-d>'] = actions.preview_scrolling_down,

                        ['<PageUp>'] = actions.results_scrolling_up,
                        ['<PageDown>'] = actions.results_scrolling_down,

                        ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                        ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                        ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                        ['<C-l>'] = actions.complete_tag,
                        ['<C-_>'] = actions.which_key, -- keys from pressing <C-/>
                    },
                    n = { -- normal mode
                        ['<esc>'] = actions.close,
                        ['<CR>'] = actions.select_default,
                        ['<C-x>'] = actions.select_horizontal,
                        ['<C-v>'] = actions.select_vertical,
                        ['<C-t>'] = actions.select_tab,

                        ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                        ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                        ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

                        ['j'] = actions.move_selection_next,
                        ['k'] = actions.move_selection_previous,
                        ['H'] = actions.move_to_top,
                        ['M'] = actions.move_to_middle,
                        ['L'] = actions.move_to_bottom,

                        ['<Down>'] = actions.move_selection_next,
                        ['<Up>'] = actions.move_selection_previous,
                        ['gg'] = actions.move_to_top,
                        ['G'] = actions.move_to_bottom,

                        ['<C-u>'] = actions.preview_scrolling_up,
                        ['<C-d>'] = actions.preview_scrolling_down,

                        ['<PageUp>'] = actions.results_scrolling_up,
                        ['<PageDown>'] = actions.results_scrolling_down,

                        ['?'] = actions.which_key,
                    },
                },
            },
            pickers = {
                find_files = {
                    theme = "dropdown",
                },
            },
            extensions = {
                -- Your extension configuration goes here:
                -- extension_name = {
                --   extension_config_key = value,
                -- }
                -- please take a look at the readme of the extension you want to configure
            }
        }

        telescope.load_extension('fzf')

        local keymap = vim.keymap.set
        keymap('n', '<leader>ff', builtin.find_files,  { desc = 'Fuzzy finds files in cwd' })
        keymap('n', '<leader>fo', builtin.oldfiles,    { desc = 'Lists previously opened files' })
        keymap('n', '<leader>fg', builtin.live_grep,   { desc = 'Finds strings in cwd' })
        keymap('n', '<leader>fw', builtin.grep_string, { desc = 'Finds string under cursor in cwd' })
        keymap('n', '<leader>fb', builtin.buffers,     { desc = 'Lists open buffers in current neovim instance' })
        keymap('n', '<leader>fk', builtin.keymaps,     { desc = 'Lists keymappings' })
        keymap('n', '<leader>fh', builtin.help_tags,   { desc = 'Lists available help tags' })

    end,
}
