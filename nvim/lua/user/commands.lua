vim.api.nvim_create_user_command('Format', 'lua vim.lsp.buf.formatting({async = true})', {})
vim.api.nvim_create_user_command('Blame', ':Gitsigns toggle_current_line_blame', {})
