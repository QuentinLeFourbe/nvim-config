return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true })
      end,
      desc = "Format buffer",
      mode = { "n", "v" },
    },
  },
  config = function()
    require("conform").setup({
      -- Define your formatters
      formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettierd" },
        html = { "prettierd" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        javascriptreact = { "prettierd" },
      },

      -- Set default options
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 500 },
      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
    })
  end,
}
