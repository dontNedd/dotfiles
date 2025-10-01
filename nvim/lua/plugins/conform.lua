return {
    { -- Autoformat
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_format = "fallback" })
                end,
                mode = "",
                desc = "[F]ormat buffer",
            },
        },
        opts = {
            notify_on_error = false,
            smart_indent = true,
            format_on_save = function(bufnr)
                local disable_filetypes = { c = false, cpp = false }
                if disable_filetypes[vim.bo[bufnr].filetype] then
                    return nil
                else
                    return {
                        timeout_ms = 500,
                        lsp_format = "fallback",
                    }
                end
            end,
            formatters_by_ft = {
                lua = { "stylua" },
                -- c = { exe = "clang-format", arg = { "--style=LLVM" } },
                -- cpp = { exe = "clang-format", arg = { "--style=LLVM" } },

                -- Conform can also run multiple formatters sequentially
                -- python = { "isort", "black" },
                --
                -- You can use 'stop_after_first' to run the first available formatter from the list
                -- javascript = { "prettierd", "prettier", stop_after_first = true },
            },
        },
    },

    -- Auto-adjust Neovim indentation to match formatter
    {
        "neovim/nvim-lspconfig", -- optional if you want LSP hooks
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "c", "cpp" },
                callback = function()
                    vim.opt_local.expandtab = true -- always use spaces
                    vim.opt_local.shiftwidth = 4
                    vim.opt_local.tabstop = 4
                    vim.opt_local.softtabstop = 4
                end,
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "lua" },
                callback = function()
                    vim.opt_local.expandtab = true -- always use spaces
                    vim.opt_local.shiftwidth = 4
                    vim.opt_local.tabstop = 4
                    vim.opt_local.softtabstop = 4
                end,
            })
        end,
    },
}
