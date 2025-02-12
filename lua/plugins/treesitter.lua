-- for better syntax highlighting
-- source: https://github.com/nvim-treesitter/nvim-treesitter

return {
  "nvim-treesitter/nvim-treesitter", name = "treesitter",
  opts = {
    ensure_installed = { 
      "vimdoc", "lua", "python",
      "c", "cpp", "cmake",
      "typescript", "javascript",
      "markdown", 
    },
    ignore_install = {},
    sync_install = false,
    auto_install = true,
    hightlight = {
      enable = true,
      additional_vim_regex_highlighting = false
    },
    indent = {
      enable = true,
    }
  }
}
