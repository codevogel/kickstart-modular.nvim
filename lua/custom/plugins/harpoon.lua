return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      -- basic config from https://github.com/ThePrimeagen/harpoon/tree/harpoon2
      require('harpoon'):setup()
    end,
    keys = function()
      local harpoon = require 'harpoon'
      return {
        {
          '<leader>ha',
          function()
            harpoon:list():add()
          end,
          desc = 'Harpoon: Add file',
        },
        {
          '<leader>hw',
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = 'Harpoon: Open menu',
        },
        {
          '<leader>hh',
          function()
            harpoon:list():select(1)
          end,
          desc = 'Harpoon: Go to file 1',
        },
        {
          '<leader>hj',
          function()
            harpoon:list():select(2)
          end,
          desc = 'Harpoon: Go to file 2',
        },
        {
          '<leader>hk',
          function()
            harpoon:list():select(3)
          end,
          desc = 'Harpoon: Go to file 3',
        },
        {
          '<leader>hl',
          function()
            harpoon:list():select(4)
          end,
          desc = 'Harpoon: Go to file 4',
        },
      }
    end,
  },
  -- Indicator of current harpoon selection in Lualine --
  {
    'letieu/harpoon-lualine',
    dependencies = {
      {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
      },
    },
  },
}
