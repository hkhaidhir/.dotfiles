return {
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     config = function()
    --         require("catppuccin").setup({
    --             flavour = "mocha",  -- latte, frappe, macchiato, mocha
    --             transparent_background = false, -- disables setting the background color.
    --             integrations = {
    --                 cmp = true,
    --                 gitsigns = true,
    --                 nvimtree = true,
    --                 treesitter = true,
    --                 notify = false,
    --                 dashboard = true,
    --                 mason = true,
    --                 fidget = true,
    --                 harpoon = true,
    --                 lsp_trouble = true,
    --                 treesitter_context = true,
    --                 telescope = {
    --                     enabled = true,
    --                     style = "nvchad",
    --                 },
    --                 mini = {
    --                     enabled = true,
    --                     indentscope_color = "",
    --                 },
    --                 -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    --             },
    --         })
    --
    --         -- setup must be called before loading
    --         -- vim.cmd.colorscheme("catppuccin-mocha")
    --     end,
    -- },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require('tokyonight').setup({
                style = "night",
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    }
}
