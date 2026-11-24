return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        pyright = { enabled = false },
        ty = { enabled = true },
      },
    },
  },
}
