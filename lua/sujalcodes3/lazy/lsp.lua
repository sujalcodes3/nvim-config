return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "williamboman/mason.nvim",
                dependencies = {
                    "williamboman/mason-lspconfig.nvim",
                    "hrsh7th/cmp-nvim-lsp",
                    'hrsh7th/nvim-cmp'
                },
                config = function()
                    -- installing lsp
                    local capabilities = require("cmp_nvim_lsp").default_capabilities()

                    local on_attach = function(_, _)
                        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                            vim.lsp.diagnostic.on_publish_diagnostics, {
                                -- delay update diagnostics
                                update_in_insert = true,
                            }
                        )
                        vim.keymap.set("n", "gd", function()
                            vim.lsp.buf.definition()
                        end, {})
                        vim.keymap.set("n", "K", function()
                            vim.lsp.buf.hover()
                        end, {})
                        vim.keymap.set("n", "<leader>vws", function()
                            vim.lsp.buf.workspace_symbol()
                        end, {})
                        vim.keymap.set("n", "<leader>vd", function()
                            vim.diagnostic.open_float()
                        end, {})
                        vim.keymap.set("n", "[d", function()
                            vim.diagnostic.goto_next()
                        end, {})
                        vim.keymap.set("n", "]d", function()
                            vim.diagnostic.goto_prev()
                        end, {})
                        vim.keymap.set("n", "<leader>ca", function()
                            vim.lsp.buf.code_action()
                        end, {})
                        vim.keymap.set("n", "<leader>vrr", function()
                            vim.lsp.buf.references()
                        end, {})
                        vim.keymap.set("n", "<leader>vrn", function()
                            vim.lsp.buf.rename()
                        end, {})
                        vim.keymap.set("i", "<C-a>", function()
                            vim.lsp.buf.signature_help()
                        end, {})
                    end

                    require("mason").setup({})
                    require("mason-lspconfig").setup({
                        ensure_installed = {
                            "tailwindcss",
                            --"pylsp",
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
                                        on_attach = on_attach,
                                        capabilities = capabilities,
                                    })
                                else
                                    require("lspconfig")[server_name].setup({
                                        on_attach = on_attach,
                                        capabilities = capabilities,
                                    })
                                end
                            end,
                        },
                    })

                    -- lsp installation and configuration over
                    --
                    --
                    -- completion configuration started
                    local cmp = require("cmp")
                    cmp.setup({
                        --snippet = {
                        --    expand = function(args)
                        --        require("luasnip").lsp_expand(args.body)
                        --    end,
                        --},
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

                    -- completion configuration end
                end
            },
        },
    },
}
