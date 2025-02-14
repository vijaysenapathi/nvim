-- for better syntax highlighting
-- source: https://github.com/nvim-treesitter/nvim-treesitter

return {
  "nvim-treesitter/nvim-treesitter", name = "treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "lua", "luadoc", "query",
      "vim", "vimdoc",
      "bash", "c", "cpp", "cmake",
      "html", "typescript", "javascript",
      "markdown", "markdown_inline",
      "python"
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
