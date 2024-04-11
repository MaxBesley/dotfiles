return {

    {
        'phha/zenburn.nvim',
        name = 'zenburn',
        lazy = false,
        priority = 1000,
        config = function()
            require('zenburn').setup()
        end,
    },
--
--    {
--        'maxmx03/solarized.nvim',
--        lazy = false,
--        priority = 1000,
--        config = function()
--            vim.o.background = 'dark'
--            vim.cmd.colorscheme('solarized')
--        end,
--    },
--
--    {
--        'dasupradyumna/midnight.nvim',
--        lazy = false,
--        priority = 1000,
--        config = function()
--            vim.cmd.colorscheme('midnight')
--        end,
--    },
--
--    {
--        'shaunsingh/seoul256.nvim',
--        lazy = false,
--        priority = 1000,
--        config = function()
--            vim.g.seoul256_disable_background = true
--            require('seoul256')
--        end,
--    },

}

