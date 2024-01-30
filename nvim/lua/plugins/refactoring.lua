return {
    "theprimeagen/refactoring.nvim",
    config = function()
        require("refactoring").setup({})

        vim.keymap.set( "v", "<leader>ri", function() require('refactoring').refactor('Inline Variable') end)
    end,

}
