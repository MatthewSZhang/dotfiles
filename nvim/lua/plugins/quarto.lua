return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      debug = false,
      closePreviewOnExit = true,
      lspFeatures = {
        enabled = true,
        chunks = "curly",
        languages = { "r", "python", "julia", "bash", "html" },
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      codeRunner = {
        enabled = true,
        default_method = "molten", -- "molten", "slime", "iron" or <function>
        ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
        -- Takes precedence over `default_method`
        never_run = { "yaml" }, -- filetypes which are never sent to a code runner
      },
    },
    keys = {
      -- Preview
      { "<localleader>qp", "<cmd>QuartoPreview<cr>", desc = "Quarto Preview" },
      { "<localleader>qc", "<cmd>QuartoClosePreview<cr>", desc = "Close Quarto Preview" },

      -- Quarto commands
      { "<localleader>q?", "<cmd>QuartoHelp<cr>", desc = "Quarto Help" },
      { "<localleader>qi", "<cmd>QuartoActivate<cr>", desc = "Quarto Activate" },

      -- Send code
      { "<localleader>qr", "<cmd>QuartoSend<cr>", desc = "Run cell" },
      { "<localleader>qA", "<cmd>QuartoSendAll<cr>", desc = "Run all cells" },
      { "<localleader>ql", "<cmd>QuartoSendLine<cr>", desc = "Run line" },
    },
  },
}
