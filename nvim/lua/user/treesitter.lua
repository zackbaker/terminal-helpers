require'nvim-treesitter.configs'.setup {
    ensure_installed = {"python", "lua", "sql"},
    highlight = { enable = true },
    indent = { enable = true }
}
