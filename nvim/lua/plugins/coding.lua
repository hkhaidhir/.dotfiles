return {
	{
		"echasnovski/mini.comment",
		version = false,
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		},
	},

	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = {
			enable_autocmd = false,
		},
	},

	{
		"theprimeagen/refactoring.nvim",
		config = function()
			require("refactoring").setup({})

			vim.keymap.set("v", "<leader>ri", function()
				require("refactoring").refactor("Inline Variable")
			end)
		end,
	},
}
