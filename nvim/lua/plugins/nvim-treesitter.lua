require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "python",
    "go",
    "lua",
    "bash",
    "fish",
  },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
