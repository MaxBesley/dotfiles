-- The first section of this article got the icons working on wsl (https://medium.com/@vedantkadam541/beautify-your-windows-terminal-using-nerd-fonts-and-oh-my-posh-4f4393f097)
return {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
    config = function()
        require('nvim-web-devicons').setup {}
    end,
}
