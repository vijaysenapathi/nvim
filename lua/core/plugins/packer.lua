-- automatically make sure packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  -- Base packer plugin
  use "wbthomason/packer.nvim"

  -- colorschemes
  use { "catppuccin/nvim", as = "catppuccin" }

  -- fancy icons
  use 'nvim-tree/nvim-web-devicons'

  -- file explorer
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons", opt=true }
  }

  -- Startup screen
  -- use {
  --     "startup-nvim/startup.nvim",
  --     requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  -- }

  -- status line
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true }
  }

  -- tab line
  use 'kdheepak/tabline.nvim'

  -- shows keyboard shortcuts
  use "folke/which-key.nvim"

  -- fuzzy searcher
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.1",
    requires = { "nvim-lua/plenary.nvim" }
  }

  -- syntax highlighting
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/playground"

  -- better terminal
  use "akinsho/toggleterm.nvim"

  -- Language Server Protocol
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }

  -- auto complete
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "onsails/lspkind.nvim" -- For customizing suggestions

  use "L3MON4D3/LuaSnip" -- NVIM CMP requires a snippet engine
  use ({"saadparwaiz1/cmp_luasnip", run = "make install_jsregexp"})
  use "windwp/nvim-autopairs" -- CMP should auto pair braces

  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-nvim-lsp" -- nvim builtin lsp
  --[[
    -- auto complete
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-nvim-lsp" -- nvim builtin lsp
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions

    -- debugging
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "mfussenegger/nvim-dap-python"
    ]]
  use "numToStr/Comment.nvim"

  -- Git tools
  use "tpope/vim-fugitive"
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- For working well with tmux
  -- use "christoomey/vim-tmux-navigator"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

