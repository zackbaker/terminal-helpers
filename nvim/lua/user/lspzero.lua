local lsp_zero = require('lsp-zero')
-- require('lspconfig').intelephense.setup({})

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"jsonls", "pyright"},
  handlers = {
    lsp_zero.default_setup,
  },
})

