return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"lua_ls",
					"gopls",
					"templ",
					"html",
					"cssls",
					"pylsp",
					"yamlls",
					"jsonls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			--local lspconfig = require("lspconfig")
			local lspconfig = vim.lsp.config
			local configs = require("lspconfig.configs")
			if not configs.roc_ls then
				configs.roc_ls = {
					default_config = {
						cmd = { "roc_language_server", "--stdio" },
						capabilties = capabilities,
						filetypes = {
							"roc",
						},
						single_file_support = true,
					},
				}
			end
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				-- cmd = { "lua_ls" },
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Recognize 'vim' as a global variable
						},
						workspace = {
							library = {
								vim.api.nvim_get_runtime_file("", true),
								"${3rd}/love2d/library",
							}, -- Include Neovim runtime files
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.prismals.setup({
				capabilities = capabilities,
			})
			lspconfig.yamlls.setup({
				capabilities = capabilities,
			})
			lspconfig.templ.setup({
				capabilities = capabilities,
				filetypes = { "templ" },
			})

			if not configs.ts_ls then
				configs.ts_ls = {
					default_config = {
						cmd = { "typescript-language-server", "--stdio" },
						capabilties = capabilities,
						filetypes = {
							"javascript",
							"javascriptreact",
							"typescript",
							"typescriptreact",
							"html",
						},
						root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", ".git"),
						single_file_support = true,
					},
				}
			end
			lspconfig.eslint.setup({
				capabilties = capabilities,
			})

			function get_python_path()
				-- Check if there's an active virtual environment
				local venv_path = os.getenv("VIRTUAL_ENV")
				if venv_path then
					return venv_path .. "/bin/python3"
				else
					-- get os name
					local os_name = require("utils").get_os()
					-- get os interpreter path
					if os_name == "windows" then
						return "C:/python312"
					elseif os_name == "linux" then
						return "/usr/bin/python3"
					end
					-- Fallback to global Python interpreter
				end
			end

			lspconfig.pylsp.setup({
				capabilties = capabilities,
				settings = {
					python = {
						pythonPath = get_python_path(),
					},
				},
			})

			lspconfig.marksman.setup({
				capabilties = capabilities,
			})
		end,
	},
}
