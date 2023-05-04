-- vim.api.nvim_exec([[
--   function! SynGroup()
--       let l:s = synID(line('.'), col('.'), 1)
--       echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
--   endfun
--
-- ]], false)


vim.keymap.set(
  "n", "<F12>",
  function()
    local result = vim.treesitter.get_captures_at_cursor(0)
    print(vim.inspect(result))
  end,
  { noremap = true, silent = false }
)

