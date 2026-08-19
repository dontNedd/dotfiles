-------- Generic LSP --------
local function lsp_keymaps(client, bufnr)
    local opts = {buffer = bufnr}

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
    buffer = bufnr,
    desc = 'Go to definition',
})

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {
    buffer = bufnr,
    desc = 'Go to declaration',
})

vim.keymap.set('n', 'gr', vim.lsp.buf.references, {
    buffer = bufnr,
    desc = 'Show references',
})

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {
    buffer = bufnr,
    desc = 'Show hover information',
})

vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {
    buffer = bufnr,
    desc = 'Rename symbol',
})

vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, {
    buffer = bufnr,
    desc = 'Code action',
})

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {
    buffer = bufnr,
    desc = 'Previous diagnostic',
})

vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {
    buffer = bufnr,
    desc = 'Next diagnostic',
})
end

-------- C++/C --------
vim.lsp.config("clangd", {
    cmd = {"clangd"},
    filetypes = {'c', 'cpp', 'objc', 'objcpp'},
    on_attach = lsp_keymaps,
})
vim.lsp.enable("clangd")

-------- Lua --------
vim.lsp.config("lua_ls", {
    cmd = {"lua-language-server"},
    filetypes = {'lua'},

    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'},
            },

            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
    on_attach = lsp_keymaps,
})
vim.lsp.enable("lua_ls")

