return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  opts = {
    preset = "helix",
    defaults = {},
    spec = {
      {
        mode = { "n", "v" },
        { "<leader><tab>", group = "tabs" },
        { "<leader>c", group = "code" },
        { "<leader>d", group = "debug" },
        { "<leader>dp", group = "profiler" },
        { "<leader>f", group = "file/find" },
        { "<leader>g", group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>q", group = "quit/session" },
        { "<leader>s", group = "search/snacks" },
        { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
        { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        { "gz", group = "surround", icon = { icon = "󰗄 ", color = "yellow" } },
        { "z", group = "fold" },
        { "co", desc = "Choose Ours (Conflict)", icon = { icon = "󰄬 ", color = "green" } },
        { "ct", desc = "Choose Theirs (Conflict)", icon = { icon = "󰄬 ", color = "blue" } },
        { "cb", desc = "Choose Both (Conflict)", icon = { icon = "󰄬 ", color = "yellow" } },
        { "c0", desc = "Choose None (Conflict)", icon = { icon = "󰅖 ", color = "red" } },
        {
          "<leader>b",
          group = "buffer",
          expand = function()
            return require("which-key.extras").expand.buf()
          end,
        },
        {
          "<leader>w",
          group = "windows",

          proxy = "<c-w>",
          expand = function()
            return require("which-key.extras").expand.win()
          end,

        },
        -- better descriptions
        { "gx", desc = "Open with system app" },
      },

    },
  },
  keys = {

    {
      "<leader>?",

      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Keymaps (which-key)",
    },
    {
      "<c-w><space>",

      function()
        require("which-key").show({ keys = "<c-w>", loop = true })
      end,

      desc = "Window Hydra Mode (which-key)",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    if not vim.tbl_isempty(opts.defaults) then
      wk.register(opts.defaults)
    end

  end,
}
