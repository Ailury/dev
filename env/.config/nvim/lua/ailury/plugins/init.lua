return {
	"nvim-lua/plenary.nvim", -- Common plugin with lua functions for several plugins
	"christoomey/vim-tmux-navigator", -- tmux & split window nav
    -- fixes the well know nvim bug
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                {
                    path = "${3rd}/plenary.nvim/lua",
                    words = { "plenary" }
                },
            },
        },
    }

}
