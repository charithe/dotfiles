require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  ensure_installed = {
      "go",
      "yaml",
      "json",
      "rust",
  },
})