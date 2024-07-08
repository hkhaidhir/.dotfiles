return {

    { "stevearc/dressing.nvim",     event = "VeryLazy" },

    -- {
    --     "j-hui/fidget.nvim",
    --     config = function()
    --         require("fidget").setup({
    --             notification = {
    --                 override_vim_notify = true,
    --                 window = {
    --                     winblend = 0,
    --                 },
    --             },
    --         })
    --     end,
    -- },

    { "nvim-tree/nvim-web-devicons" },

    {
        'rasulomaroff/reactive.nvim',
        config = function()
            require('reactive').setup {
                builtin = {
                    modemsg = true,
                    cursorline = true
                },
                load = { 'catppuccin-mocha-cursor' }
            }
        end,
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            presets = {
                lsp_doc_border = true,
            }
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
        }
    },

    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        opts = {
            timeout = 5000,
        },
        config = function()
            local notify = require("notify")
            local filtered_message = { "No information available" }

            vim.notify = function(message, level, opts)
                local merged_opts = vim.tbl_extend("force", {
                    on_open = function(win)
                        local buf = vim.api.nvim_win_get_buf(win)
                        vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
                    end,
                }, opts or {})

                for _, msg in ipairs(filtered_message) do
                    if message == msg then
                        return
                    end
                end
                return notify(message, level, merged_opts)
            end
        end,
    },

    -- {
    --     "nvim-lualine/lualine.nvim",
    --     -- event = "VeryLazy",
    --     config = function()
    --         require("lualine").setup({
    --             options = {
    --                 icons_enabled = true,
    --                 theme = "auto",
    --                 component_separators = "|",
    --                 section_separators = { left = "", right = "" },
    --                 disabled_filetypes = {
    --                     statusline = {},
    --                     winbar = {},
    --                 },
    --                 ignore_focus = {},
    --                 always_divide_middle = true,
    --                 globalstatus = false,
    --                 refresh = {
    --                     statusline = 1000,
    --                     tabline = 1000,
    --                     winbar = 1000,
    --                 },
    --             },
    --             sections = {
    --                 lualine_a = {
    --                     { "mode", separator = { left = "" }, right_padding = 2 },
    --                 },
    --                 lualine_b = { "branch", "diff" },
    --                 lualine_c = { "filename" },
    --                 lualine_x = { "diagnostics", "filetype" },
    --                 lualine_y = { "progress" },
    --                 lualine_z = {
    --                     { "location", separator = { right = "" }, left_padding = 2 },
    --                 },
    --             },
    --             inactive_sections = {
    --                 lualine_a = { "filename" },
    --                 lualine_b = {},
    --                 lualine_c = {},
    --                 lualine_x = {},
    --                 lualine_y = {},
    --                 lualine_z = { "location" },
    --             },
    --             tabline = {},
    --             winbar = {},
    --             inactive_winbar = {},
    --             extensions = {},
    --         })
    --     end,
    -- },
}
