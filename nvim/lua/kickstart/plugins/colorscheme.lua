return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('gruvbox').setup {
        styles = {
          comments = { italic = false },
        },
      }
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
