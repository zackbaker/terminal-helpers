local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
    disable_netrw = true,
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    renderer = {
        highlight_git = true,
        indent_markers = { enable = true },
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "M",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },
            }
        }
    },
}
