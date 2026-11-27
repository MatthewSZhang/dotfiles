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
