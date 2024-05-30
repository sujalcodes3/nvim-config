return {
    "neovim/nvim-lspconfig",
    {
        "williamboman/mason.nvim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    'hrsh7th/cmp-nvim-lsp',
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                completion = {
                    completeopt = 'menu, menuone, noinsert'
                },
                sources = {
                    { name = 'nvim_lsp' },
                },
                mapping = {
                    --['<C-e>'] = cmp.mapping.abort(),
                    ['<C-Space'] = cmp.mapping.complete(),
                    -- `Enter` key to confirm completion
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    -- Scroll up and down in the completion documentation
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-p>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = 'insert' })
                        else
                            cmp.complete()
                        end
                    end),
                    ['<C-n>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = 'insert' })
                        else
                            cmp.complete()
                        end
                    end),
                    ['<C-y>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = 'insert' })
                        else
                            cmp.complete()
                        end
                    end),
                },
            })
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("n", "<C-m>", function() vim.lsp.buf.signature_help() end, opts)
            end)
            lsp_zero.setup_servers({ 'pylsp', 'lua_ls', 'tsserver', 'rust_analyzer', 'gopls', 'html', 'clangd' })

            require('mason').setup({})
            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        if server_name == 'lua_ls' then
                            require('lspconfig')[server_name].setup({
                                settings = {
                                    Lua = {
                                        diagnostics = {
                                            globals = { 'vim' },
                                        },
                                    },
                                },
                                capabilities = {
                                    workspace = {
                                        didChangeWatchedFile = {
                                            dynamicRegistration = true,
                                        },
                                    },
                                },
                            })
                        else
                            require('lspconfig')[server_name].setup({
                                capabilities = {
                                    workspace = {
                                        didChangeWatchedFile = {
                                            dynamicRegistration = true,
                                        },
                                    },
                                },
                            })
                        end
                    end,
                },
            })
        end
    },
    'L3MON4D3/LuaSnip',
}
