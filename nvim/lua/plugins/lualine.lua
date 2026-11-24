local function get_cjk_word_count()
  local is_visual = vim.fn.mode():match("[vV\22]")
  local lines = {}

  if is_visual then
    local _, srow, scol = unpack(vim.fn.getpos("v"))
    local _, erow, ecol = unpack(vim.fn.getpos("."))

    if srow > erow or (srow == erow and scol > ecol) then
      srow, erow = erow, srow
      scol, ecol = ecol, scol
    end

    lines = vim.api.nvim_buf_get_lines(0, srow - 1, erow, false)
    if #lines > 0 then
      lines[#lines] = string.sub(lines[#lines], 1, ecol)
      lines[1] = string.sub(lines[1], scol)
    end
  else
    lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  end

  local text = table.concat(lines, "\n")

  -- 1. Count CJK characters (Unicode ranges: 0x4E00-0x9FFF, 0x3400-0x4DBF, etc.)
  local _, cjk_count = text:gsub("[\228-\233][\128-\191][\128-\191]", "")

  -- 2. Strip CJK characters and count remaining whitespace-separated words
  local non_cjk_text = text:gsub("[\228-\233][\128-\191][\128-\191]", " ")
  local words_count = 0
  for _ in non_cjk_text:gmatch("%S+") do
    words_count = words_count + 1
  end

  return words_count + cjk_count
end

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 1, {
        function()
          return string.format("%d 字", get_cjk_word_count())
        end,
        cond = function()
          local ft = vim.bo.filetype
          return ft == "markdown" or ft == "mdx"
        end,
      })
    end,
  },
}
