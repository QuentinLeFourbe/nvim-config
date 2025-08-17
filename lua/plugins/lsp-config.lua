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
				"jdtls",
				"vue_ls",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("java").setup()
			local lspConfig = require("lspconfig")
			lspConfig.jdtls.setup({ capabilities = capabilities })
			lspConfig.lua_ls.setup({ capabilities = capabilities })
			lspConfig.html.setup({ capabilities = capabilities })
			lspConfig.graphql.setup({ capabilities = capabilities })
			lspConfig.jsonls.setup({ capabilities = capabilities })
			lspConfig.remark_ls.setup({ capabilities = capabilities })
			lspConfig.dockerls.setup({ capabilities = capabilities })
			lspConfig.cssls.setup({ capabilities = capabilities })
			lspConfig.eslint.setup({
				capabilities = capabilities,
				on_attach = function(_, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})
			lspConfig.denols.setup({
				capabilities = capabilities,
				root_dir = lspConfig.util.root_pattern("deno.json", "deno.jsonc"),
			})
			lspConfig.yamlls.setup({ capabilities = capabilities })

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
