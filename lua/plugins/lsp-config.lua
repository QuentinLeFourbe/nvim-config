return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"html",
					"graphql",
					"jsonls",
					"remark_ls",
					"dockerls",
					"cssls",
				},
			})
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspConfig = require("lspconfig")
			lspConfig.lua_ls.setup({ capabilities = capabilities })
			lspConfig.html.setup({ capabilities = capabilities })
			lspConfig.graphql.setup({ capabilities = capabilities })
			lspConfig.jsonls.setup({ capabilities = capabilities })
			lspConfig.remark_ls.setup({ capabilities = capabilities })
			lspConfig.dockerls.setup({ capabilities = capabilities })
			lspConfig.cssls.setup({ capabilities = capabilities })
			lspConfig.denols.setup({
				capabilities = capabilities,
				root_dir = lspConfig.util.root_pattern("deno.json", "deno.jsonc"),
			})
			lspConfig.yamlls.setup({ capabilities = capabilities })

			require("typescript-tools").setup({
				capabilities = capabilities,
				-- root_dir = function(fname)
				-- 	local deno_root = lspConfig.util.root_pattern("deno.json", "deno.jsonc")(fname)
				-- 	if deno_root then
				-- 		return nil
				-- 	end
				--
				-- 	-- INFO: stealed from:
				-- 	-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/tsserver.lua#L22
				-- 	local root_dir = lspConfig.util.root_pattern("tsconfig.json")(fname)
				-- 		or lspConfig.util.root_pattern("package.json", "jsconfig.json", ".git")(fname)
				--
				-- 	-- INFO: this is needed to make sure we don't pick up root_dir inside node_modules
				-- 	local node_modules_index = root_dir and root_dir:find("node_modules", 1, true)
				-- 	if node_modules_index and node_modules_index > 0 then
				-- 		root_dir = root_dir:sub(1, node_modules_index - 2)
				-- 	end
				-- 	return root_dir
				-- end,
				-- single_file_support = false,
			})

			--      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
			--     vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			--    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			--   vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			--  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<space>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})
		end,
	},
}
