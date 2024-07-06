return {
    'HiPhish/rainbow-delimiters.nvim',
    config = function()
        require('rainbow-delimiters.setup').setup {
            highlight = {
                'RainbowDelimiterBlue',
                'RainbowDelimiterOrange',
                'RainbowDelimiterGreen',
                'RainbowDelimiterYellow',
                'RainbowDelimiterViolet',
                'RainbowDelimiterCyan',
                'RainbowDelimiterRed',
            },
        }
    end,
}
