-- from https://www.youtube.com/watch?v=6pAG3BHurdM&ab_channel=JoseanMartinez
return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- set header
        dashboard.section.header.val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
        }

        -- set menu
        dashboard.section.buttons.val = {
            dashboard.button("e", "> New File", "<cmd>ene<CR>"),
            dashboard.button("SPC ee", "> Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
            dashboard.button("SPC ff", "> Find File", "<cmd>Telescope find_files<CR>"),
            dashboard.button("SPC fg", "> Find Word", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("q", "> Quit NVIM", "<cmd>qa<CR>"),
        }

        -- send config to alpha
        alpha.setup(dashboard.opts)

        -- disable folding on alpha buffer
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
}

