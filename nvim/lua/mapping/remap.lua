vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Move to Beginning/End of Line
vim.keymap.set("n", "H", "^", opts)
vim.keymap.set("n", "L", "$", opts)
vim.keymap.set("v", "H", "^", opts) -- visual mode
vim.keymap.set("v", "L", "$", opts) -- visual mode
-- map <C-c> to <esc>
vim.cmd [[
  map <C-c> <esc>
  nnoremap <C-c> <esc>
  xnoremap <C-c> <esc>
  inoremap <C-c> <esc>
  vnoremap <C-c> <esc>
  cnoremap <C-c> <esc>
]]
