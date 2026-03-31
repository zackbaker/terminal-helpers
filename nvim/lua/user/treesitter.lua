require'nvim-treesitter.configs'.setup {
    ensure_installed = {"python", "lua", "sql", "query"},
    highlight = { enable = true },
    indent = { enable = true }
}
