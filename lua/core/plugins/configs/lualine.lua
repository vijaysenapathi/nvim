local function custom_file_info()
  --return buffer.filetype .. buffer.fileencoding .. buffer.fileformat
  local buffer = vim.bo
  return
    buffer.fileencoding .."[".. buffer.fileformat.."]"
end

local function custom_file_position()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  col = col + 1
  local total_buffer_lines = vim.api.nvim_buf_line_count(0)
  local percentage = math.floor(100 * row / total_buffer_lines)
  return percentage .. "%% " .. row .. ":" .. total_buffer_lines .. "☰ :" .. col
end


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {'NvimTree'},
      winbar = {'Dap Scopes'},
    },
    ignore_focus = {
      "dapui_watches", "dapui_breakpoints",
      "dapui_scopes", "dapui_console",
      "dapui_stacks", "dap-repl"
    },
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {
        'branch',
        draw_empty = true
      },
      {
        'diagnostics',
        symbols = {
          error = '■ ',
          warn = '■ ',
          info = '■ ',
          hint = '■ '
        },
      }
    },
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {
      custom_file_info
      --[[ 'encoding',
      {
        'fileformat',
        symbols = {
          unix = 'unix',
          dos = 'dos',
          mac = 'mac',
        }
      } ]]
    },
    lualine_z = {custom_file_position}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  -- tabline = {
  --   lualine_a = {
  --     {
  --       'buffers',
  --       symbols = {
  --         modified = '*',      -- Text to show when the buffer is modified
  --         alternate_file = '#', -- Text to show to identify the alternate file
  --         directory =  '',     -- Text to show when the buffer is a directory
  --       }
  --     }
  --   },
  --   lualine_b = {},
  --   lualine_c = {},
  --   lualine_x = {},
  --   lualine_y = {
  --     'diff',
  --   },
  --   lualine_z = {
  --     'tabs'
  --   }
  -- },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
