local M = {}

M.setup = function()
  -- Clear existing highlights
  vim.cmd("hi clear")

  -- Set background type
  vim.o.background = "dark"  -- or "light"
  vim.g.colors_name = "ciapre"

  -- Define colors
  local colors = {
    bg = "#090300",
    fg = "#A5A2A2",
    red = "#DB2D20",
    green = "#01A252",
    blue = "#01A0E4",
    yellow = "#FDED02",
    purple = "#A16A94",
    orange = "#B5E4F4",
    gray = "#A5A2A2",
  }

  -- Assign highlight groups
  vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
  vim.api.nvim_set_hl(0, "Comment", { fg = colors.gray, italic = true })
  vim.api.nvim_set_hl(0, "String", { fg = colors.green })
  vim.api.nvim_set_hl(0, "Function", { fg = colors.blue, bold = true })
  vim.api.nvim_set_hl(0, "Error", { fg = colors.red, bold = true })
end

return M
