-- better status line
-- source: https://github.com/nvim-lualine/lualine.nvim


local function custom_file_info()
  local buffer = vim.bo
  return buffer.fileencoding .."[".. buffer.fileformat.."]"
end


local function custom_file_position()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  col = col + 1
  local total_buffer_lines = vim.api.nvim_buf_line_count(0)
  local percentage = math.floor(100 * row / total_buffer_lines)

  local fancy_seperator1 = "%% 󰉸 "
  local fancy_seperator2 = " 󰹳 "

  -- have a minimum of 3 padded space for percentage
  local percent_padded = string.format("%s", percentage)

  local status = percent_padded .. fancy_seperator1
  status = status .. row .. "/" .. total_buffer_lines .. fancy_seperator2
  status = status .. col

  return status
end


local function centered_winbar()
  local win_width = vim.api.nvim_win_get_width(0)
  local text = "%f"  -- This shows the filename

  -- Calculate padding needed to center text
  local padding = math.floor((win_width - #vim.fn.expand('%:t')) / 2)

  -- Return centered winbar text
  return string.rep(" ", math.max(0, padding)) .. text
end


-- TODO: remove all commented out configuration contents
return {
  "nvim-lualine/lualine.nvim", name = "lualine", lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      icons_enabled = true,
      theme = "catppuccin",
      component_separators = { left = "", right = ""},
      section_separators = { left = "", right = ""},
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
          draw_empty = true
        },
        {
          "diagnostics",
          symbols = {
            error = "■ ",
            warn = "■ ",
            info = "■ ",
            hint = "■ "
          },
        }
      },
      lualine_c = {{
        "filename",
        symbols = {
          modified = ' ',      -- Text to show when the file is modified.
          readonly = '',      -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[No Name]', -- Text to show for unnamed buffers.
          newfile = '[New]',     -- Text to show for newly created file before first write
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
          modified = ' ',      -- Text to show when the file is modified.
          readonly = '',      -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[No Name]', -- Text to show for unnamed buffers.
          newfile = '[New]',     -- Text to show for newly created file before first write
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
            modified = ' ',      -- Text to show when the buffer is modified
            alternate_file = ' ', -- Text to show to identify the alternate file
            directory =  '',     -- Text to show when the buffer is a directory
          },
        }
      },
      lualine_z = {
        {
          "tabs",
          symbols = {
            modified = ' ',  -- Text to show when the file is modified.
          }
        }
      }
    },
    winbar = {
    },
    inactive_winbar = {
    },
    extensions = {}
  }
}
