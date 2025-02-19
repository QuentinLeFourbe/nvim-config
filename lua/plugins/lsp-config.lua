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
