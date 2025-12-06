
local colors = {
  fg  = "#e6d8cb",
  bg  = "#141211",
  black  = "#141211",
  black_bright = "#45423c",
  red = "#e65a5a",
  red_bright = "#e68c8c",
  green = "#6fe65a",
  green_bright = "#96e68c",
  yellow = "#e6b55a",
  yellow_bright = "#e6c88c",
  blue = "#5ab5e6",
  blue_bright = "#8cbde6",
  magenta = "#815ae6",
  magenta_bright = "#aa8ce6",
  cyan = "#5ae6b5",
  cyan_bright = "#8ce6bd",
  white = "#96961d",
  white_bright = "#8c8c81",
  orange = "#e6e65a",
  orange_bright = "#e6e68c",
}

local function apply()
  local set = vim.api.nvim_set_hl

  -- UI basics
  set(0, "Normal",        { fg = colors.fg, bg = colors.bg })
  set(0, "NormalFloat",   { fg = colors.fg, bg = colors.black })
  set(0, "FloatBorder",   { fg = colors.black_bright, bg = colors.black })
  set(0, "LineNr",        { fg = colors.black_bright })
  set(0, "CursorLineNr",  { fg = colors.yellow_bright, bold = true })
  set(0, "CursorLine",    { bg = colors.black })
  set(0, "Visual",        { bg = colors.black_bright })
  set(0, "Search",        { bg = colors.yellow_bright, fg = colors.bg })
  set(0, "IncSearch",     { bg = colors.yellow, fg = colors.bg })

  -- Syntax highlighting
  set(0, "Comment",        { fg = colors.black_bright, italic = true })
  set(0, "Keyword",        { fg = colors.yellow })
  -- set(0, "Function",       { fg = colors.yellow })
  set(0, "Identifier",     { fg = colors.blue_bright })
  set(0, "String",         { fg = colors.green_bright })
  set(0, "Number",         { fg = colors.magenta_bright })
  set(0, "Boolean",        { fg = colors.orange_bright })
  set(0, "Type",           { fg = colors.red_bright })
  set(0, "Constant",       { fg = colors.yellow_bright })
  set(0, "Operator",       { fg = colors.fg })

  -- Diagnostics
  set(0, "DiagnosticError", { fg = colors.red })
  set(0, "DiagnosticWarn",  { fg = colors.yellow })
  set(0, "DiagnosticInfo",  { fg = colors.blue })
  set(0, "DiagnosticHint",  { fg = colors.cyan })
  set(0, "ErrorMsg",        { fg = colors.red })

  -- LSP
  set(0, "LspReferenceText",  { bg = colors.black_bright })
  set(0, "LspReferenceWrite", { bg = colors.black_bright })
  set(0, "LspReferenceRead",  { bg = colors.black_bright })
end

apply()

return {}

