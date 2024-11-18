return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local theme = require("lualine.themes.nord")
        local lazy_status = require("lazy.status")
        require("lualine").setup({
            options = {
                theme = theme,
            },
            sections = {
                lualine_x = {
                    -- Lazy pending updates count
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                },
            },
        })
    end,
}
