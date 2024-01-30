return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        config = function()
            local actions = require("telescope.actions")
            local builtin = require("telescope.builtin")

            require("telescope").setup({
                defaults = {
                    mappings = {
                        n = {
                            ["q"] = actions.close,
                        },
                    },
                },
            })

            vim.keymap.set("n", "<leader>pf", function()
                builtin.find_files({
                    no_ignore = false,
                    hidden = true,
                })
            end)
            vim.keymap.set("n", "<C-p>", builtin.git_files, {})
            vim.keymap.set("n", "<leader>ps", builtin.grep_string, {})
            vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
        end,
    },


}
