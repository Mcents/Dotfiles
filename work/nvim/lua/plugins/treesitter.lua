return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "elixir", "heex", "eex", "lua", "vim", "bash" },
      highlight = { enable = true },
    },
  },
}
