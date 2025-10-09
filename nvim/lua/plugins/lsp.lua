return {
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },
    {
        'saghen/blink.cmp',
        event = 'VimEnter',
        dependencies = {
            {
                'L3MON4D3/LuaSnip',
                version = '2.*',
                build = (vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0) and nil or 'make install_jsregexp',
            },
            'folke/lazydev.nvim',
        },
        opts = {
            keymap = { preset = 'default' },
            appearance = { nerd_font_variant = 'mono' },
            completion = { documentation = { auto_show = false, auto_show_delay_ms = 500 } },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'lazydev' },
                providers = { lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 } },
            },
            snippets = { preset = 'luasnip' },
            fuzzy = { implementation = 'lua' },
            signature = { enabled = true },
        },
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'mason-org/mason.nvim', opts = {} },
            'mason-org/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            'saghen/blink.cmp',
        },
        config = function()
            require('blink.cmp').setup({
                keymap = { preset = 'default' },
                completion = { documentation = { auto_show = true } },
            })

            local on_attach = function(client, bufnr)
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
                end
                map('grn', vim.lsp.buf.rename, 'Rename')
                map('grr', vim.lsp.buf.references, 'References')
                map('grd', vim.lsp.buf.definition, 'Definition')
                map('gri', vim.lsp.buf.implementation, 'Implementation')
                map('grD', vim.lsp.buf.declaration, 'Declaration')
            end

            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local servers = {
                lua_ls = require('lsp.lua_ls'),
                clangd = require('lsp.cpp'),
            }
            local ensure_installed = vim.tbl_keys(servers)
            vim.list_extend(ensure_installed, { 'stylua' })
            require('mason-tool-installer').setup { ensure_installed = ensure_installed }
            require('mason-lspconfig').setup {
                ensure_installed = {},
                automatic_installation = false,
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                        server.on_attach = on_attach
                        require('lspconfig')[server_name].setup(server)
                    end,
                },
            }
        end,
    },
}
