return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },

    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                prompt_prefix = "   ",
                selection_caret = " ",
                entry_prefix = " ",
                sorting_strategy = "ascending",

                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                    },
                    width = 0.87,
                    height = 0.80,
                },

                mappings = {
                    n = {
                        ["q"] = actions.close,
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        local set = vim.keymap.set

        -- Telescope keymaps
        set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
        set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
        set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
        set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
        set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
        set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
        set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
        set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
        set("n", "<leader>sc", builtin.git_commits, { desc = "[S]earch git commits" })
        set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
        set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

        set("n", "<leader>/", function()
            builtin.current_buffer_fuzzy_find(
                require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                })
            )
        end, { desc = "[/] Fuzzily search in current buffer" })

        set("n", "<leader>sn", function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end, { desc = "[S]earch [N]eovim files" })
    end,
}
