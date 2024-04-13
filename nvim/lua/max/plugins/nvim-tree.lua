return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local nvimtree = require('nvim-tree')

        -- disable netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- change color for arrows in tree to light blue
        vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
        vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

        -- custom key mappings
        local function my_on_attach(bufnr)
            local api = require "nvim-tree.api"

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
            vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
--            vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
--            vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
--            vim.keymap.set("n", "v", api.node.open.vertical, opts "Open: Vertical Split")
--            vim.keymap.del("n", "<C-k>", { buffer = bufnr })
--            vim.keymap.set("n", "<S-k>", api.node.open.preview, opts "Open Preview")
        end

        -- configure nvim-tree
        nvimtree.setup {
            on_attach = my_on_attach,
            hijack_cursor = true,
            disable_netrw = true,
            sync_root_with_cwd = true,
            view = {
                width = 35,
                number = false,
                relativenumber = false,
                side = 'left',
            },
            renderer = {
                add_trailing = false,
                group_empty = false,
                highlight_git = false,
                full_name = false,
                highlight_opened_files = 'none',
                root_folder_label = ':t',
                indent_width = 2,
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = '',
                            arrow_open = '',
                        },
                    },
                },
                special_files = { 'Makefile', 'makefile', 'Dockerfile', 'README.md', 'readme.md', 'Cargo.toml', 'package.json', 'cabal.project', 'stack.yaml', 'project.clj', 'mix.exs', 'requirements.txt', 'Gemfile', 'build.xml' },
                symlink_destination = true,
            },
            actions = {
                open_file = {
                    quit_on_open = false,
                    window_picker = {
                        enable = false,
                    },
                },
            },
            update_focused_file = {
                enable = true,
                update_root = true,
                debounce_delay = 15,
            },
            git = {
                enable = true,
                ignore = false,
            },
            filters = {
                dotfiles = false,
            },
            diagnostics = {
                enable = true,
                show_on_dirs = false,
                show_on_open_dirs = true,
                debounce_delay = 50,
                severity = {
                    min = vim.diagnostic.severity.HINT,
                    max = vim.diagnostic.severity.ERROR,
                },
            },
        }

        -- set keymaps
        local keymap = vim.keymap.set
        keymap('n', '<leader>ee', '<Cmd>NvimTreeToggle<CR>',         { desc = 'Toggle file explorer' })
        keymap('n', '<leader>ef', '<Cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer on current file' })
        keymap('n', '<leader>ec', '<Cmd>NvimTreeCollapse<CR>',       { desc = 'Collapse the tree structure' })
        keymap('n', '<leader>er', '<Cmd>NvimTreeRefresh<CR>',        { desc = 'Refresh file explorer' })
    end,
}

