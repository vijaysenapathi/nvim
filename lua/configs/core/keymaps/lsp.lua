
-- TODO: map all the following lsp
-- TODO: figureout what inline hints are
-- toggle inline hints (lsp inlay_hint enable)

-- displays signature information about the symbol under the cursor in a floating window
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "definition on hover" })

-- jump to the definition of the symbol under the cursor
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[g]oto [d]efinition" })

-- jump to the definition of the symbol under the cursor
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[g]oto [d]eclaration" })

-- jumps to the definition of the type of the symbol under the cursor.
vim.keymap.set("n", "gtd", vim.lsp.buf.declaration, { desc = "[g]oto [t]ype [d]efinition" })

-- lists all the references to the symbol under the cursor in the quickfix window
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "[g]oto [r]eferences" })

-- lists all the implementations for the symbol under the cursor in the quickfix window.
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "[g]oto [i]mplementations" })

-- lists all symbols in the current buffer in the quickfix window.
vim.keymap.set("n", "gfs", vim.lsp.buf.document_symbol, { desc = "[g]oto [f]ile [s]ymbols" })

-- renames all references to the symbol under the cursor
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[r]e[n]ame" })

-- selects a code action available at the current cursor position
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })

-- formats a buffer using the attached (and optionally filtered) language server clients.
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "[f]ormat [f]ile" })

