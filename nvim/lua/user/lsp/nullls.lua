local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    debug = false,
    sources = {
        diagnostics.flake8.with({
            filter = function(diagnostic)
                return diagnostic.code ~= "E501" or diagnostic.code ~= "W391"
            end
        }),
    },
}
