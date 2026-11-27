return {
  "ok97465/ipybridge.nvim",
  config = function()
    require("ipybridge").setup({
      profile_name = "vim", -- or nil to omit --profile
      startup_script = "import_in_console.py", -- looked up in CWD
      sleep_ms_after_open = 1000, -- defer init to allow IPython to start
      set_default_keymaps = false, -- applies by default (can set false)
      terminal_winfixbuf = false, -- keep terminal window pinned to its buffer

      -- Matplotlib backend
      matplotlib_backend = nil, -- e.g. 'qt', 'inline', 'macosx', 'tk', 'agg'

      -- Browser-based plot history
      plot_viewer = {
        mode = "browser", -- "browser" or "off"
        auto_open = true, -- open the viewer automatically
        history = 40, -- max snapshots to keep
      },

      -- Spyder-like runcell/runfile support
      runcell_save_before_run = true, -- save buffer before runcell to use up-to-date file
      runfile_save_before_run = true, -- save buffer before runfile to use up-to-date file
      debugfile_save_before_run = true, -- save buffer before debugfile to use up-to-date file
      debugcell_save_before_run = true, -- save buffer before debugcell to use up-to-date file
      debugfile_auto_imports = "import numpy as np;import matplotlib.pyplot as plt;", -- hidden imports before %debugfile
      debug_cursor_tooltip = true, -- show previews for simple names while debugging

      -- Variable explorer / preview (ZMQ backend requires ipykernel + jupyter_client + pyzmq)
      viewer_max_rows = 30,
      viewer_max_cols = 20,
      -- Autoreload: 1, 2, or 'disable' (default 2)
      autoreload = 2,
    })
  end,
  keys = {
    {
      "<localleader>ii",
      function()
        require("ipybridge").toggle()
      end,
      ft = "python",
      desc = "Toggle IPython",
    },
    {
      "<localleader>ir",
      function()
        require("ipybridge").restart()
      end,
      ft = "python",
      desc = "Restart IPython",
    },
    {
      "<localleader>r",
      function()
        require("ipybridge").run_cell()
      end,
      ft = "python",
      desc = "Run Cell",
    },
    {
      "<localleader>id",
      function()
        require("ipybridge").debug_cell()
      end,
      ft = "python",
      desc = "Debug Cell",
    },
    {
      "<localleader>if",
      function()
        require("ipybridge").run_file()
      end,
      ft = "python",
      desc = "Run File",
    },
    {
      "<localleader>il",
      function()
        require("ipybridge").run_line()
      end,
      ft = "python",
      desc = "Run Line",
    },
    {
      "<localleader>iv",
      function()
        require("ipybridge").run_lines()
      end,
      mode = "v",
      ft = "python",
      desc = "Run Selected Lines",
    },
    {
      "<localleader>ib",
      function()
        require("ipybridge").toggle_breakpoint()
      end,
      ft = "python",
      desc = "Toggle Breakpoint",
    },
    {
      "<localleader>is",
      function()
        require("ipybridge").plot_open()
      end,
      ft = "python",
      desc = "Open plot history",
    },
    {
      "<localleader>ix",
      function()
        require("ipybridge").var_explorer_open()
      end,
      ft = "python",
      desc = "Open Variable Explorer",
    },
    -- Open preview for variable under cursor (or prompt if none)
    {
      "<localleader>ip",
      function()
        local name = vim.fn.expand("<cword>")
        if name ~= "" then
          require("ipybridge").request_preview(name)
        else
          vim.notify("No variable under cursor", vim.log.levels.WARN)
        end
      end,
      ft = "python",
      desc = "Preview Variable",
    },
  },
}
