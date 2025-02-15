
-- TODO: map all the following lsp
--
-- from neovim v0.11.0 docs
-- "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
-- "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
-- "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
-- "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
-- "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
-- CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|
--
-- from kickstart
-- jump to definition of word under cursor (telescope lsp definitions)
-- find references of word under cursor (lsp references)
-- jump to implementation of word under cursor (lsp implementations)
-- jump to type of word under cusor (lsp type defition)
-- find all symbols in current documents (lsp document symbols)
--



vim.api.nvim_create_autocmd( "LspAttach", {
  group = vim.api.nvim_create_augroup("keymaps-on-lsp-attach", {clear = true}),
  callback = function (event)

    local map = function (keys, func, desc, mode)
      -- normal mode by default
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, {
        buffer = event.buffer, desc = desc
      })
    end

    -- rename all references to symbol under cursor
    map("<leader>rn", vim.lsp.buf.rename, "[R]e[N]ame")

    -- perform code action for issue under cursor
    map("gra", vim.lsp.buf.code_action, "code ")

    -- show all references of symbol under cursor

    -- goto definition of word under cursor
  end
})
