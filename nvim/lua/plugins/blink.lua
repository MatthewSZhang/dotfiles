return {
  "saghen/blink.cmp",
  opts = {
    enabled = function()
      local disabled_filetypes = { "markdown", "quarto" }
      return not vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
        and vim.bo.buftype ~= "prompt"
    end,
  },
}
