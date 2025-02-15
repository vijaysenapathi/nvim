-- for better file and folder browsing
-- source: https://github.com/nvim-tree/nvim-tree.lua

-- TODO: make nerd fonts truly optional here
return {
  "nvim-tree/nvim-tree.lua", name = "nvim-tree", lazy=false,
  dependencies = {
    { "nvim-tree/nvim-web-devicons", optional = true }
  },
  config = function()
    -- disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      disable_netrw = true,
      view = {
        -- side = "center",
        float = {
          enable = false,
          --[[ open_win_config = {
            row = 2,
            col = 4,
            border = "single",
            title = " Explorer ",
            title_pos = "center"
          } ]]
        }
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        root_folder_label = false, -- This disables the root folder name
        icons = {
          web_devicons = {
            file = {
              enable = true,
              color = true,
            },
          },
          symlink_arrow = "  ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = false,
          },
          glyphs = {
            folder = {
              empty = "",
              empty_open = "",
            }
          },
        },
        special_files = {},
      },
      filters = {
        dotfiles = true,
        exclude = {".gitignore"}
      }
    })
  end,
  keys = {
    { "<F1>", ":NvimTreeToggle<CR>", desc = "OpenExplorer" },
    { "<S-F1>", ":NvimTreeFindFile<CR>", desc = "ShowFileSiblings" },
  }
}

