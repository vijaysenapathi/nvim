-- better status line
-- source: https://github.com/nvim-lualine/lualine.nvim

-- enable arrows in lualine
local arrowed_boundaries = false

local icons = {}
if vim.g.nerd_font_enabled then
  icons.component_separators = {
    left = arrowed_boundaries and "" or "",
    right = arrowed_boundaries and "" or ""
  }
  icons.section_separators = {
    left = arrowed_boundaries and "" or "",
    right = arrowed_boundaries and "" or ""
  }
  icons.diagnostics_symbol = "■ "
  icons.file_modified = " "
  icons.file_readonly = ""
  icons.buffer_modified = " "
  icons.buffer_last = " "
  icons.buffer_directory = ""
  icons.tab_modified = " "
  icons.seperator1 = "%% 󰉸 "
  icons.seperator2 = " 󰹳 "
  icons.seperator_by = "/"
  icons.nothing = "󰎂"
else
  icons.component_separators = { left = "", right = ""}
  icons.section_separators = { left = "", right = ""}
  icons.diagnostics_symbol = "#"
  icons.file_modified = "[+]"
  icons.file_readonly = "[-]"
  icons.buffer_modified = " [+]"
  icons.buffer_last = "# "
  icons.buffer_directory = ""
  icons.tab_modified = " [+]"
  -- icons.seperator1 = "%% |"
  -- icons.seperator2 = "|"
  -- the following two are not from nerd fonts
  icons.seperator1 = "%% 󰉸 "
  icons.seperator2 = " 󰹳 "
  icons.seperator_by = "/"
  icons.nothing = "*"
end


local function custom_file_info()
  local buffer = vim.bo
  return buffer.fileencoding .."[".. buffer.fileformat.."]"
end


local function custom_file_position()
  ---@type integer|string, integer|string
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  col = col + 1

  --@type integer|string
  local lines = vim.api.nvim_buf_line_count(0)

  --@type integer|string
  local percentage = math.floor(100 * row / lines)

  ---@type integer|string
  local current_line_length = #vim.api.nvim_get_current_line()
  if current_line_length == 0 then
    current_line_length = icons.nothing
    col = 0
  end

  -- minimum of 2 padding for each of the numbers
  percent = string.format("%2s", percentage)
  row = string.format("%2s", row)
  col = string.format("%2s", col)
  lines = string.format("%-2s", lines)
  current_line_length = string.format("%-2s", current_line_length)

  local status = percent .. icons.seperator1
  status = status .. row .. icons.seperator_by .. lines .. icons.seperator2
  status = status .. col .. icons.seperator_by .. current_line_length

  return status
end




return {
  "nvim-lualine/lualine.nvim", name = "lualine", lazy = false,
  dependencies = { { "nvim-tree/nvim-web-devicons", optional = true } },
  config = function ()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "catppuccin",
        component_separators = icons.component_separators,
        section_separators = icons.section_separators,
        disabled_filetypes = {
          statusline = {"NvimTree", "Outline", "fugitiveblame"},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        }
      },
      sections = {
        lualine_a = {"mode"},
        lualine_b = {
          {
            "branch",
            icon = vim.g.nerd_font_enabled and "" or "",
            seperator = nil,
            draw_empty = false
          },
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics_symbol,
              warn = icons.diagnostics_symbol,
              info = icons.diagnostics_symbol,
              hint = icons.diagnostics_symbol
            },
          }
        },
        lualine_c = {{
          "filename",
          symbols = {
            modified = icons.file_modified,
            readonly = icons.file_readonly,
            unnamed = '[No Name]',
            newfile = '[New]',
          }

        }},
        lualine_x = {"filetype"},
        lualine_y = {custom_file_info},
        lualine_z = {custom_file_position}
      },
      inactive_sections = {
        lualine_a = {""},
        lualine_b = {},
        lualine_c = {{
          "filename",
          symbols = {
            modified = icons.file_modified,
            readonly = icons.file_readonly,
            unnamed = '[No Name]',
            newfile = '[New]',
          }

        }},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {
        lualine_a = {
          {
            "buffers",
            symbols = {
              modified = icons.buffer_modified,
              alternate_file = icons.buffer_last,
              directory =  icons.buffer_directory
            },
          }
        },
        lualine_z = {
          {
            "tabs",
            symbols = {
              modified = icons.tab_modified
            }
          }
        }
      },
      winbar = {
      },
      inactive_winbar = {
      },
      extensions = {}
    })

    -- disable showing mode the vanilla way as mode is being show on lualine
    vim.opt.showmode = false
  end
}
