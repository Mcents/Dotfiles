-- Set leader key
vim.g.mapleader = " "

-- Insert mode mapping: jj -> <Esc>
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Insert mode abbreviation: pry -> require IEx; IEx.pry
vim.cmd([[iabbrev pry require IEx; IEx.pry]])

-- Normal mode mapping: sq
vim.keymap.set("n", "sq", ':silent! normal mpea"<Esc>bi"<Esc>`pl', { noremap = true, silent = true })

-- Normal mode mapping: qs
vim.keymap.set("n", "qs", ":silent! normal mpeld bhd `ph<CR>", { noremap = true, silent = true })

-- Normal mode mapping: Ctrl-T toggles NERDTree
vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })

-- Snacks picker
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", function() Snacks.picker.grep_word() end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-P>", function() Snacks.picker.files() end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", function() Snacks.picker.files() end, { silent = true })

-- Visual mode: Ctrl-C -> copy selection to system clipboard via pbcopy (macOS)
vim.keymap.set("v", "<C-c>", ":w !pbcopy<CR><CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>mf", ":w | silent !mix format<CR>")
