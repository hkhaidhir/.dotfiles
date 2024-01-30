return {

    "folke/zen-mode.nvim",
    config = function()
        vim.keymap.set("n", "<leader>zz", function()
            require("zen-mode").setup({
                window = {
                    width = 90,
                    options = {},
                },
            })
            require("zen-mode").toggle()
            vim.wo.wrap = false
            vim.wo.number = true
            vim.wo.rnu = true
        end)

        vim.keymap.set("n", "<leader>zZ", function()
            require("zen-mode").setup({
                window = {
                    width = 80,
                    options = {},
                },
                plugins = {
                    twilight = { enabled = false },
                },
            })
            require("zen-mode").toggle()
            vim.wo.wrap = false
            vim.wo.number = false
            vim.wo.rnu = false
            vim.opt.colorcolumn = "0"
        end)

        vim.keymap.set("n", "<leader>Z", function()
            require("zen-mode").setup({
                window = {
                    width = 80,
                    options = {},
                },
            })
            require("zen-mode").toggle()
            vim.wo.wrap = false
            vim.wo.number = false
            vim.wo.rnu = false
            vim.opt.colorcolumn = "0"
        end)
    end,
}