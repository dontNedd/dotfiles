return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")

        toggleterm.setup {
            -- eddit return value to change size
            size = function(term)
                if term.direction == "horizontal" then
                    return 16
                elseif term.direction == "vertical" then
                    return 75
                end
            end,
            open_mapping = nil,
            persist_size = true,
            start_in_insert = true,
            shade_terminals = false,
        }

        -- Horizontal terminal
        vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>',
            { desc = "Term Horizontal", noremap = true, silent = true })

        -- Vertical terminal
        vim.keymap.set('n', '<leader>tr', '<cmd>ToggleTerm direction=vertical<CR>',
            { desc = "Term Vertical", noremap = true, silent = true })

        -- jk to exit insert mode in terminal
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { noremap = true, silent = true })
    end,
}
