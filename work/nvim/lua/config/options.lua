vim.diagnostic.config({
  signs = false, -- hides the left-side icons
})

vim.opt.signcolumn = "no"

vim.o.title = true
-- Set the title format
vim.o.titlestring = "%t"

vim.g.trouble_lualine = false
