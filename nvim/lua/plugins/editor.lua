return {
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})

			local t = {}
			-- Syntax: t[keys] = {function, {function arguments}}
			t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "170" } }
			t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "170" } }

			require("neoscroll.config").set_mappings(t)
		end,
	},

	{
		"folke/twilight.nvim",
		opts = {
			dimming = {
				alpha = 0.5,
			},
			-- context = 15,
		},
	},

	{ "eandrju/cellular-automaton.nvim", event = "VeryLazy" },

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },

		config = function()
			require("trouble").setup({
				icons = false,
			})

			vim.keymap.set("n", "<leader>tt", function()
				require("trouble").toggle()
			end)

			vim.keymap.set("n", "<leader>tn", function()
				require("trouble").next({ skip_groups = true, jump = true })
			end)

			vim.keymap.set("n", "<leader>tp", function()
				require("trouble").previous({ skip_groups = true, jump = true })
			end)
		end,
	},

	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},

	{ "nvim-treesitter/nvim-treesitter-context" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			disable_filetype = { "TelescopePrompt", "vim" },
		},
	},

	{
		"windwp/nvim-ts-autotag",
		lazy = true,
		opts = {},
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({})

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():append()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<C-h>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<C-t>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<C-n>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<C-s>", function()
				harpoon:list():select(4)
			end)
		end,
	},

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

	{

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
	},
}
