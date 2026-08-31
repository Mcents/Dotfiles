-- Set leader key
vim.g.mapleader = " "

-- Insert mode mapping: jj -> <Esc>
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Insert mode abbreviation: pry -> require IEx; IEx.pry
vim.cmd([[iabbrev pry require IEx; IEx.pry]])

-- Normal mode mapping: Ctrl-B -> Ctrl-Z
vim.keymap.set("n", "<C-B>", "<C-Z>", { noremap = true, silent = true })

-- Normal mode mapping: sq
vim.keymap.set("n", "sq", ':silent! normal mpea"<Esc>bi"<Esc>`pl', { noremap = true, silent = true })

-- Normal mode mapping: qs
vim.keymap.set("n", "qs", ":silent! normal mpeld bhd `ph<CR>", { noremap = true, silent = true })

-- Normal mode mapping: Ctrl-T toggles NERDTree
vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })

-- fzf stuff
vim.keymap.set("n", "<leader>/", ":Ag<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", ":Ag <C-R><C-W><CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-P>", ":Files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", ":Files<CR>", { silent = true })
vim.keymap.set("n", "<C-S-p>", function()
  local dir = vim.fn.input("Directory: ", "", "dir")
  if dir ~= "" then
    vim.cmd("Files " .. dir)
  else
    vim.cmd("Files")
  end
end, { silent = true })

-- Visual mode: Ctrl-C -> copy selection to system clipboard via pbcopy (macOS)
vim.keymap.set("v", "<C-c>", ":w !pbcopy<CR><CR>", { noremap = true, silent = true })
