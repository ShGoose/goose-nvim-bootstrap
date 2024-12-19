local lspconfig = require('lspconfig')

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "bashls",
  },
})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT", -- Для Neovim
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = { enable = false },
    },
  },
})

lspconfig.fish_lsp.setup({
  cmd = { "fish-lsp", "start" },
  filetypes = { "fish" },
})
-- lspconfig.bashls.setup()
