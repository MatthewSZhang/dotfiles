return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 100
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = false
      vim.g.molten_auto_open_output = false
      vim.g.molten_auto_image_popup = true
      vim.api.nvim_set_hl(0, "MoltenCell", { bg = "NONE" }) -- remove cell highlighting
    end,
    keys = {
      { "<localleader>mi", "<cmd>MoltenInit<cr>", desc = "Initialize kernel" },
      { "<localleader>mr", "<cmd>MoltenRestart<cr>", desc = "Restart kernel" },
      { "<localleader>mx", "<cmd>MoltenInterrupt<cr>", desc = "Interrupt kernel" },
      { "<localleader>o", "<cmd>noautocmd MoltenEnterOutput<cr>", desc = "Show/enter output" },
      { "<localleader>s", "<cmd>MoltenShowOutput<cr>", desc = "Show output" },
      { "<localleader>c", "<cmd>MoltenHideOutput<cr>", desc = "Hide output" },
      {
        "<localleader>v",
        ":<C-u>MoltenEvaluateVisual<CR>gv",
        mode = "v",
        desc = "Evaluate visual selection",
      },
    },
  },
  {
    -- see the image.nvim readme for more information about configuring this plugin
    "3rd/image.nvim",
    build = false,
    opts = {
      backend = "kitty", -- whatever backend you would like to use
      processor = "magick_cli",
      max_width = 300,
      max_height = 100,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },
}
