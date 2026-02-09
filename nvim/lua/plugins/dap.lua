return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-telescope/telescope-dap.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local dapvt = require("nvim-dap-virtual-text")

            dapui.setup()
            dapvt.setup()

            local mason_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"
            -- Adapter config for codelldb
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = mason_path, -- <-- adjust this path
                    args = { "--port", "${port}" },
                },
            }

            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                },
            }

            dap.configurations.c = dap.configurations.cpp

            -- Automatically open and close dap-ui
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- Telescope DAP extension
            require("telescope").load_extension("dap")
            -- Optional: keymaps for debugging
            vim.api.nvim_set_keymap("n", "<F1>", "<Cmd>lua require'dap'.continue()<CR>",
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<F2>", "<Cmd>lua require'dap'.step_over()<CR>",
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<F3>", "<Cmd>lua require'dap'.step_into()<CR>",
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<F4>", "<Cmd>lua require'dap'.step_out()<CR>",
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>",
                { noremap = true, silent = true, desc = "[B]reakpoint" })
            vim.api.nvim_set_keymap("n", "<Leader>B",
                "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
                { noremap = true, silent = true })
        end,
    },
}
