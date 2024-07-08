return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",              -- latte, frappe, macchiato, mocha
        transparent_background = false, -- disables setting the background color.
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          dashboard = true,
          mason = true,
          noice = true,
          neogit = true,
          fidget = true,
          harpoon = true,
          native_lsp = { enabled = true },
          lsp_trouble = true,
          indent_blankline = {
            enabled = false,
            scope_color = "sapphire",
            colored_indent_levels = false,
          },
          treesitter_context = true,
          telescope = {
            enabled = true,
          },
        },
      })

      -- require('reactive').setup {
      --   load = { 'catppuccin-mocha-cursor', 'catppuccin-mocha-cursorline' }
      -- }

      for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        vim.api.nvim_set_hl(0, group, {})
      end

      -- setup must be called before loading
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },


  -- {
  --     "folke/tokyonight.nvim",
  --     lazy = false,
  --     priority = 1000,
  --     opts = {},
  --     config = function()
  --         require('tokyonight').setup({
  --             style = "night",
  --         })
  --         vim.cmd.colorscheme("tokyonight")
  --     end,
  -- },

  -- {
  --     "rebelot/kanagawa.nvim",
  --     lazy = false,
  --     priority = 1000,
  --     config = function()
  --         require('kanagawa').setup({
  --             overrides = function(colors)
  --                 local theme = colors.theme
  --                 return {
  --                     NormalFloat = { bg = "none" },
  --                     FloatBorder = { bg = "none" },
  --                     FloatTitle = { bg = "none" },
  --
  --                     NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
  --
  --                     LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
  --                     MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
  --                 }
  --             end,
  --         })
  --         vim.cmd("colorscheme kanagawa")
  --     end
  -- },

  -- { "rose-pine/neovim", name = "rose-pine",
  --     lazy = false,
  --     priority = 1000,
  --     config = function()
  --         vim.cmd("colorscheme rose-pine-moon")
  --     end
  -- }

  -- { "EdenEast/nightfox.nvim",
  --     lazy = false,
  --     priority = 1000,
  --     config = function()
  --         vim.cmd("colorscheme nightfox")
  --     end
  -- }
}
