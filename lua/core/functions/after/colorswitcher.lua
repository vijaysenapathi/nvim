local color_scheme_switch = function ()
  local current_colorscheme = vim.g.colors_name
  local new_colorscheme
  if current_colorscheme == "catppuccin-macchiato" then
    new_colorscheme = "catppuccin-latte"
  else
    new_colorscheme = "catppuccin-macchiato"
  end
  vim.cmd("colorscheme " .. new_colorscheme)
  print("Switched to colorscheme " .. new_colorscheme)
end


-- Creating a vim command
vim.api.nvim_create_user_command(
  "ToggleColor",
  function (_)
    color_scheme_switch()
  end,
  { nargs = 0 }
)
