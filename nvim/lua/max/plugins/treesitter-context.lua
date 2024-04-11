return {
    'nvim-treesitter/nvim-treesitter-context',
    lazy = true,
    config = function()
        require('treesitter-context').setup()
    end,
}

