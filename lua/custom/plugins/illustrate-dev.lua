return {
  dir = '~/random/illustrate.nvim-for-obsidian',
  dev = true,
  config = function()
    require('illustrate').setup {
      enable_folding = true,
    }
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  keys = function()
    local illustrate = require 'illustrate'
    local illustrate_finder = require 'illustrate.finder'

    return {
      {
        '<leader>i',
        '',
        desc = '[I]llustrator',
      },
      {
        '<leader>is',
        function()
          illustrate.create_and_open_svg()
        end,
        desc = 'Create and open a new SVG file with provided name.',
      },
      {
        '<leader>ia',
        function()
          illustrate.create_and_open_ai()
        end,
        desc = 'Create and open a new Adobe Illustrator file with provided name.',
      },
      {
        '<leader>io',
        function()
          illustrate.open_under_cursor()
        end,
        desc = 'Open file under cursor (or file within environment under cursor).',
      },
      {
        '<leader>if',
        function()
          illustrate_finder.search_and_open()
        end,
        desc = 'Use telescope to search and open illustrations in default app.',
      },
      {
        '<leader>ic',
        function()
          illustrate_finder.search_create_copy_and_open()
        end,
        desc = 'Use telescope to search existing file, copy it with new name, and open it in default app.',
      },
      {
        '<leader>ie',
        function()
          require('illustrate').embed_svg()
        end,
        desc = 'Embed SVG content from file',
      },
    }
  end,
}
