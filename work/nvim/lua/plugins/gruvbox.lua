return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- Set to false to load on startup, or true for lazy loading with an event/command
    priority = 1000, -- Ensures it loads early
    opts = {
      transparent_mode = true, -- Set to true for a transparent background
      bold = true,
      -- Additional options can be configured here
      -- For example, to customize styles for specific elements:
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent",
      -- },
      -- on_highlights = function(hl)
      --   hl.Comment = { fg = "#444444" } -- Example: Change comment color
      -- end,
    },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "gruvbox" } },
}
