return {
    {
        "nvim-treesitter/nvim-treesitter",
        evevent = { "BufReadPost", "BufNewFile", "BufWritePost" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter")
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
                    use_languagetree = true, -- for embedded langs
                },
                indent = { enable = true },
                autotag = { enable = true },
                refactor = {
                    highlight_definitions = {
                        enable = true,
                    },
                    highlight_current_scope = {
                        enable = false,
                    },
                },
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
