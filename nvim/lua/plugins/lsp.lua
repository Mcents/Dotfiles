return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")

      if not configs.expert then
        configs.expert = {
          default_config = {
            cmd = { "/Users/michaelcentrelli/bin/expert_darwin_arm64" },
            filetypes = { "elixir", "eelixir", "heex" },
            root_dir = function(fname)
              return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()
            end,
            settings = {},
          },
        }
      end

      lspconfig.expert.setup({
        on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        end,
      })
    end,
  },
}
