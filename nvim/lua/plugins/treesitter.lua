return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                        },
                    },
                },
                highlight = {
                    enable = true,
                },
                indent = {enable = true},
                autotag = {enable = true},
                ensure_installed = {
                    "json",
                    "python",
                    "lua",
                    "vim",
                    "vimdoc",
                    "c",
                    "cpp",
                    "yaml",
                    "bash",
                    "dockerfile",
                },
                auto_install = false,
            })

        end
    }
}
