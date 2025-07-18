-- Setup for LSP, Mason, and Treesitter

-- Setup Mason (LSP installer)
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "tsserver", "bashls", "jsonls" },
  automatic_installation = true,
})

-- Setup capabilities (for autocompletion)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
  capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- On attach to LSP
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap.set

  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, opts)
end

-- Setup each LSP server
local lspconfig = require("lspconfig")
local servers = { "lua_ls", "pyright", "tsserver", "bashls", "jsonls" }

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- Setup Treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua", "python", "javascript", "typescript", "bash", "json"
  },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      node_decremental = "grm",
    },
  },
})
