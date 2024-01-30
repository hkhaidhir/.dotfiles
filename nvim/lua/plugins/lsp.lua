return{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
        config = function()

    local lsp_zero = require("lsp-zero")

    -- lsp.preset("recommended")
    require("mason").setup({})
    require("mason-lspconfig").setup({
        ensure_installed = {
            "tsserver",
            "rust_analyzer",
            "emmet_ls",
            "html",
            "cssls",
            "tailwindcss",
            "lua_ls",
            "phpactor",
        },
    })

    -- Fix Undefined global 'vim'
    -- lsp_zero.nvim_workspace()

    lsp_zero.set_sign_icons({
        error = "E",
        warn = "W",
        hint = "H",
        info = "I",
    })

    vim.diagnostic.config({
        virtual_text = false,
        severity_sort = true,
        float = {
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    })

    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()
    local cmp_format = require("lsp-zero").cmp_format()

    require("luasnip.loaders.from_vscode").lazy_load()

    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    cmp.setup({
        formatting = cmp_format,
        preselect = "item",
        completion = {
            completeopt = "menu,menuone,noinsert",
        },
        window = {
            documentation = cmp.config.window.bordered(),
        },
        sources = {
            { name = "path" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "copilot", group_index = 2 },
            { name = "buffer", keyword_length = 3 },
            { name = "luasnip", keyword_length = 2 },
        },
        mapping = cmp.mapping.preset.insert({
            -- confirm completion item
            ["<C-y>"] = cmp.mapping.confirm({ select = false }),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-l>"] = cmp.mapping.complete(),

            -- toggle completion menu
            -- ['<C-e>'] = cmp_action.toggle_completion(),

            ["<Tab>"] = nil,
            ["<S-Tab>"] = nil,

            -- navigate between snippet placeholder
            ["<C-d>"] = cmp_action.luasnip_jump_forward(),
            ["<C-b>"] = cmp_action.luasnip_jump_backward(),

            -- scroll documentation window
            ["<C-f>"] = cmp.mapping.scroll_docs(5),
            ["<C-u>"] = cmp.mapping.scroll_docs(-5),
        }),
    })

    lsp_zero.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "<leader>vws", function()
            vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set("n", "<leader>vd", function()
            vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_prev()
        end, opts)
        vim.keymap.set("n", "<leader>vca", function()
            vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set("n", "<leader>vrr", function()
            vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "<leader>vrn", function()
            vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("i", "<C-h>", function()
            vim.lsp.buf.signature_help()
        end, opts)
    end)

    require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
    require("lspconfig").rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    -- configure html server
    require("lspconfig").html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    require("lspconfig").phpactor.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    -- configure typescript server with plugin
    require("lspconfig").tsserver.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
        cmd = { "typescript-language-server", "--stdio" },
        init_options = {
            preferences = {
                disableSuggestions = true,
            },
        },
    })

    require("lspconfig").volar.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "vue" },
    })

    --configure css server with plugin
    require("lspconfig").cssls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
    -- configure tailwindcss server with plugin
    require("lspconfig").tailwindcss.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        detached = false,
    })
    -- configure emmet server with plugin
    require("lspconfig").emmet_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte", "javascript" },
    })
end,
}
