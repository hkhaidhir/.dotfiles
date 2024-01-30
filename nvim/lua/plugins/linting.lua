return {
    "mfussenegger/nvim-lint",
    config = function()
        require("lint").linters_by_ft = {
            markdown = { "vale" },
            javascript = { "eslint_d" },
            vue = { "eslint_d" },
            typescript = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            html = { "eslint_d" },
            css = { "eslint_d" },
            scss = { "eslint_d" },
            less = { "eslint_d" },
            json = { "eslint_d" },
        }
    end,

}
