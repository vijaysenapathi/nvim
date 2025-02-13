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

  -- Commented these out as they are causing a buggy lualine
  -- local fancy_seperator1 = "%% "
  -- local fancy_seperator2 = "☰ :"
  local fancy_seperator1 = "%% 󰉸 "
  local fancy_seperator2 = " 󰹳 "

  -- have a minimum of 3 padded space for percentage
  local percent_padded = string.format("%s", percentage)

  local status = percent_padded .. fancy_seperator1
  status = status .. row .. "/" .. total_buffer_lines .. fancy_seperator2
  status = status .. col

  return status
end


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
        statusline = {"NvimTree", "Outline"},
        winbar = {"Dap Scopes"},
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
      lualine_c = {"filename"},
      lualine_x = {"filetype"},
      lualine_y = {custom_file_info},
      lualine_z = {custom_file_position}
      -- lualine_z = {"location"}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      -- lualine_c = {"filename"},
      -- lualine_x = {"location"},
      lualine_y = {},
      lualine_z = {}
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
}
