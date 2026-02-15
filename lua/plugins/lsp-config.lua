return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"html",
				"graphql",
				"jsonls",
				"remark_ls",
				"dockerls",
				"cssls",
				"vue_ls",
				"vtsls",
			},
		},
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("java").setup()
			vim.lsp.config("jdtls", { capabilities = capabilities })
			vim.lsp.config("lua_ls", { capabilities = capabilities })
			vim.lsp.config("html", { capabilities = capabilities })
			vim.lsp.config("graphql", { capabilities = capabilities })
			vim.lsp.config("jsonls", { capabilities = capabilities })
			vim.lsp.config("remark_ls", { capabilities = capabilities })
			vim.lsp.config("dockerls", { capabilities = capabilities })
			vim.lsp.config("cssls", { capabilities = capabilities })

			local base_on_attach = vim.lsp.config.eslint.on_attach
			vim.lsp.config("eslint", {
				on_attach = function(client, bufnr)
					if not base_on_attach then
						return
					end

					base_on_attach(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "LspEslintFixAll",
					})
				end,
			})

			vim.lsp.config("yamlls", {
				capabilities = capabilities,
			})

			require("typescript-tools").setup({
				capabilities = capabilities,
			})

			require("config.vue")
		end,
		keys = {
			{
				"<leader>ca",
				vim.lsp.buf.code_action,
				desc = "Code action",
				mode = { "n", "v" },
			},
			{
				"<leader>cr",
				vim.lsp.buf.rename,
				desc = "Code rename",
				mode = { "n" },
			},
		},
	},
}
