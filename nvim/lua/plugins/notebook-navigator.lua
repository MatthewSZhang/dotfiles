return {
  {
    "nvim-mini/mini.hipatterns",
    event = "VeryLazy",
    dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
    opts = function()
      local nn = require("notebook-navigator")

      local opts = { highlighters = { cells = nn.minihipatterns_spec } }
      return opts
    end,
  },
  {
    "nvim-mini/mini.ai",
    event = "VeryLazy",
    dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
    opts = function()
      local nn = require("notebook-navigator")

      local opts = { custom_textobjects = { h = nn.miniai_spec } }
      return opts
    end,
  },
  {
    "GCBallesteros/NotebookNavigator.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-mini/mini.comment",
    },
    keys = {
      -- Cell navigation
      {
        "]g",
        function()
          require("notebook-navigator").move_cell("d")
          vim.cmd("normal! zz")
        end,
        desc = "Next cell",
      },
      {
        "[g",
        function()
          require("notebook-navigator").move_cell("u")
          vim.cmd("normal! zz")
        end,
        desc = "Previous cell",
      },
      -- Cell editing
      {
        "<localleader>a",
        function()
          require("notebook-navigator").split_cell()
        end,
        desc = "Split cell",
      },
      {
        "<localleader>d",
        "dah",
        desc = "Delete cell",
        remap = true,
      },
    },
  },
}
