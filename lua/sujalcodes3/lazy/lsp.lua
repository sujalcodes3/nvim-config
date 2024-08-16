return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
        },
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!)
        -- build = "make install_jsregexp",
        config = function()
            local ls = require("luasnip")
            vim.keymap.set({ "i" }, "<C-K>", function()
                ls.expand()
            end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-f>", function()
                ls.jump(1)
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end,
    },
    "neovim/nvim-lspconfig",
    {
        "williamboman/mason.nvim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    "hrsh7th/cmp-nvim-lsp",
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                completion = {
                    completeopt = "menu, menuone, noinsert",
                },
                window = {
                    --completion = cmp.config.window.bordered(),
                    --documentation = cmp.config.window.bordered(),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    --{ name = "luasnip" },
                    { name = "buffer" },
                    { name = "vim-dadbod-completion" },
                    { name = "path" },
                }),
                mapping = {
                    --['<C-e>'] = cmp.mapping.abort(),
                    --["<C-i"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                    --["<C-e>"] = cmp.mapping({
                    --    i = cmp.mapping.abort(),
                    --    c = cmp.mapping.close(),
                    --}),
                    -- `Enter` key to confirm completion
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    -- Scroll up and down in the completion documentation
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-p>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = "insert" })
                        else
                            cmp.complete()
                        end
                    end),
                    ["<C-n>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = "insert" })
                        else
                            cmp.complete()
                        end
                    end),
                    ["<C-y>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = "insert" })
                        else
                            cmp.complete()
                        end
                    end),
                },
            })
            --cmp.setup.filetype({ "sql" }, {
            --	sources = {
            --	},
            --})
        end,
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(_, bufnr)
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
                vim.keymap.set("n", "<leader>ca", function()
                    vim.lsp.buf.code_action()
                end, opts)
                vim.keymap.set("n", "<leader>vrr", function()
                    vim.lsp.buf.references()
                end, opts)
                vim.keymap.set("n", "<leader>vrn", function()
                    vim.lsp.buf.rename()
                end, opts)
                vim.keymap.set("i", "<C-a>", function()
                    vim.lsp.buf.signature_help()
                end, opts)
            end)
            lsp_zero.setup_servers({ "pylsp", "lua_ls", "tsserver", "rust_analyzer", "gopls", "html", "clangd" })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "tailwindcss",
                    "pylsp",
                    "lua_ls",
                    "tsserver",
                    "rust_analyzer",
                    "gopls",
                    "html",
                    "clangd",
                },
                handlers = {
                    function(server_name)
                        if server_name == "lua_ls" then
                            require("lspconfig")[server_name].setup({
                                settings = {
                                    Lua = {
                                        diagnostics = {
                                            globals = { "vim" },
                                        },
                                    },
                                },
                                capabilities = capabilities,
                            })
                        else
                            require("lspconfig")[server_name].setup({
                                capabilities = capabilities,
                            })
                        end
                    end,
                },
            })
        end,
    },
}
