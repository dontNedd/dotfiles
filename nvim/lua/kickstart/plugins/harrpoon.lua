return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    -- Add file to Harpoon
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Add to Harpoon' })

    -- Toggle quick menu
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    -- Navigate to file 1-4
    vim.keymap.set('n', '<C-a>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<C-s>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<C-d>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<C-f>', function()
      harpoon:list():select(4)
    end)

    -- Navigate prev/next
    vim.keymap.set('n', '<C-S-P>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-S-N>', function()
      harpoon:list():next()
    end)
  end,
}
