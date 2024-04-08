return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- configure treesitter
        treesitter.setup({ 
            auto_install = true,

            -- enable syntax highlighting
            highlight = { enable = true },

            -- enable indentation
            indent = { enable = true },

            -- ensure these language parsers are installed
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "toml",
                "html",
                "css",
                "prisma",
                "markdown",
                "markdown_inline",
                "query",
                "graphql",
                "hlsl",
                "glsl",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "git_config",
                "vimdoc",
                "c",
                "cpp",
                "c_sharp",
                "java",
                "python",
                "ruby",
                "dart",
                "go",
                "rust",
                "haskell",
                "ocaml",
                "clojure",
                "elixir",
                "erlang",
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<M-w>",     -- maps in normal mode to init the node/scope selection
                    node_incremental = "<M-w>",   -- increment to the upper named parent
                    node_decremental = "<M-C-w>", -- decrement to the previous node
                    scope_incremental = "<M-e>",  -- increment to the upper scope (as defined in locals.scm)
                },
            },
        })
    end,
}

