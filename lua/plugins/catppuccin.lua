-- for adding the colorscheme catppuccin
-- source: https://github.com/catppuccin/nvim

return { 
  "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "macchiato",
      },
      transparent_background = false,
      show_end_of_buffer = false, -- show the '~' characters after the end of buffers
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        -- TODO: figure what to turn on
        -- cmp = true,
        -- gitsigns = true,
        -- nvimtree = true,
        -- telescope = true,
        -- notify = false,
        -- mini = false
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations
      }
    })

    -- now set the colorscheme
    vim.cmd.colorscheme "catppuccin-macchiato"
  end
}
