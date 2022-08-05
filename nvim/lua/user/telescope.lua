-- Use a protected call so we don't error out on first use
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup {
    defaults = {

        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },

        -- ["mapping"] = action
        -- Using defaults
        i = { -- insert modeline
        },

        n = { -- normal mode
        }
    }
}
