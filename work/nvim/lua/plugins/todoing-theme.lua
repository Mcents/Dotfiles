-- Todoing theme sync: exports current nvim colors to ~/.config/todoing/theme.json
-- whenever the colorscheme changes, so the Todoing macOS app stays in sync.
-- Color mappings match dooing's highlight groups for consistency.

local function hl_fg(name)
  local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
  if hl.fg then
    return string.format("#%06x", hl.fg)
  end
  return nil
end

local function hl_bg(name)
  local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
  if hl.bg then
    return string.format("#%06x", hl.bg)
  end
  return nil
end

local function export_theme()
  local theme = {
    background = hl_bg("Normal") or "#282828",
    backgroundSecondary = hl_bg("CursorLine") or "#3c3836",
    textPrimary = hl_fg("Normal") or "#ebdbb2",
    textSecondary = hl_fg("Comment") or "#928374",
    accent = hl_fg("Title") or "#fabd2f",
    selection = hl_bg("Visual") or "#504945",
    border = hl_fg("FloatBorder") or hl_fg("Type") or "#504945",
    -- Match dooing highlights
    pending = hl_fg("Question") or hl_fg("Title") or "#fabd2f",
    inProgress = hl_fg("Function") or hl_fg("Identifier") or "#83a598",
    done = hl_fg("Comment") or "#928374",
    tag = hl_fg("Type") or hl_fg("Title") or "#fabd2f",
    success = hl_fg("DiagnosticOk") or hl_fg("String") or "#b8bb26",
    warning = hl_fg("DiagnosticWarn") or hl_fg("WarningMsg") or "#fe8019",
    error = hl_fg("DiagnosticError") or hl_fg("ErrorMsg") or "#fb4934",
    dueToday = hl_fg("DiagnosticWarn") or hl_fg("WarningMsg") or "#fe8019",
    dueSoon = hl_fg("DiagnosticInfo") or hl_fg("Identifier") or "#83a598",
    quickKey = hl_fg("Identifier") or hl_fg("Function") or "#83a598",
  }

  local config_dir = vim.fn.expand("~/.config/todoing")
  vim.fn.mkdir(config_dir, "p")

  local json = vim.fn.json_encode(theme)
  local path = config_dir .. "/theme.json"
  local f = io.open(path, "w")
  if f then
    f:write(json)
    f:close()
  end
end

-- Register as a lazy.nvim plugin using init (runs before any plugin loads)
return {
  "todoing-theme-sync",
  virtual = true,
  dir = vim.fn.stdpath("config"),
  lazy = false,
  init = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("TodoingThemeSync", { clear = true }),
      callback = export_theme,
    })
    -- Also export after VimEnter so it catches the final colorscheme
    vim.api.nvim_create_autocmd("VimEnter", {
      group = vim.api.nvim_create_augroup("TodoingThemeStartup", { clear = true }),
      callback = function()
        vim.defer_fn(export_theme, 100)
      end,
    })
  end,
}
