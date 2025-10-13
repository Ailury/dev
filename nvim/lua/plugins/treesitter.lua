-- treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		-- treesitter config
		local config = require("nvim-treesitter.configs")
		config.setup({
			ignore_install = {},
			ensure_installed = {
				"vimdoc",
				"go",
				"lua",
				"python",
				"html",
				"css",
				"sql",
				"markdown",
				--        "gleam",
				--        "wgsl",
				--				"nim",
				--				"php",
				--				"typst",
				--				"purescript",
				--				"javascript",
				--				"typescript",
				--				"haskell",
				--				"zig",
				--        "latex",
				--        "rust",
				--        "c",
			},
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			modules = {},
			sync_install = true,
			auto_install = true,
		})
	end,
}
