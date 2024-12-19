-- Основные настройки
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

-- Установка плагинов
require("lazy").setup({
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",

  "nvim-treesitter/nvim-treesitter",

  "nvim-telescope/telescope.nvim",

  "rose-pine/neovim"
})


-- Настрока плагинов
require("plugins.lsp")
require("plugins.nvim-cmp")
require("plugins.nvim-treesitter")

-- Настройка маппингов
require("mapping.remap")

