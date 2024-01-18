require("neorg").setup{
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.concealer"] = {
      config = {
        icon_preset = "diamond",
        icons = {
          heading = {
            -- icons = { "◈", "◇", "◆", "⋄", "❖", "⟡" }, -- diamond preset
            -- icons = { "◉", "◆", "✿", "○", "▶", "⤷" }, -- varied preset
            icons = { "◈", "◇", "◆", "❖", "✿", "○"}
          },
          todo = {
            -- -- cancelled = { icon = "󰩺" },
            -- -- done = { icon = 8 },
            -- -- on_hold = { icon = 7 },
            -- -- pending = { icon = 6 },
            -- -- recurring = { icon = "" },
            -- uncertain = { icon = "?" },
            -- -- undone = { icon = 3 },
            -- urgent = { icon = "!" },
          },
          code_block = {
            conceal = true,
            content_only = false,
            padding = {
              left = 0
            }
          }
        }
      }
    }, -- Adds pretty icons to your documents
    ["core.presenter"] = {
      config = {
        zen_mode = "zen-mode"
      }
    },
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          work = "~/Cloud/Documents/Qure/Journal",
          notes = "~/notes",
        },
      },
    },
  },
}

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.norg"},
  command = "set conceallevel=3"
})
