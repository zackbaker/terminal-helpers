local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    debug = false,
    sources = {
        formatting.fixjson,
        diagnostics.flake8.with({
            filter = function(diagnostic)
                local ignore_codes = {"E501", "W391"}
                for _, ignore_code in pairs(ignore_codes) do
                    if diagnostic.code == ignore_code then
                        return false
                    end
                end
            end
        }),
    },
}
