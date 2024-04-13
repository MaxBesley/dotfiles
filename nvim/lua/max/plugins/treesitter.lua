return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-context' },
    build = ':TSUpdate',
    config = function()

        -- configure treesitter
        require('nvim-treesitter.configs').setup {

            -- install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- automatically install missing parsers when entering buffer
            -- recommendation: set to false if you don't have `tree-sitter` cli installed locally
            auto_install = false,

            -- list of parsers to ignore installing (or 'all')
            ignore_install = {},

            highlight = {
                enable = true,

                -- languages that will be disabled
                --disable = { 'python', 'haskell' },

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },

            indent = {
                enable = true,
                disable = { 'yaml' }
            },

            -- ensure these language parsers are installed
            ensure_installed = {
                'javascript',
                'typescript',
                'php',
                'perl',
                'pascal',
                'tsx',
                'xml',
                'json',
                'yaml',
                'toml',
                'nix',
                'html',
                'css',
                'prisma',
                'markdown',
                'markdown_inline',
                'query',
                'graphql',
                'hlsl',
                'glsl',
                'bash',
                'lua',
                'vim',
                'tmux',
                'dockerfile',
                'gitignore',
                'git_config',
                'vimdoc',
                'asm',
                'nasm',
                'c',
                'cpp',
                'c_sharp',
                'java',
                'scala',
                'python',
                'ruby',
                'dart',
                'go',
                'rust',
                'haskell',
                'ocaml',
                'elm',
                'clojure',
                'elixir',
                'erlang',
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<M-w>',     -- maps in normal mode to init the node/scope selection
                    node_incremental = '<M-w>',   -- increment to the upper named parent
                    node_decremental = '<M-C-w>', -- decrement to the previous node
                    scope_incremental = '<M-e>',  -- increment to the upper scope (as defined in locals.scm)
                },
            },
        }

        require('treesitter-context').setup { enable = true }
    end,
}

