return {
  {
    'LukasKorotaj/create-neovim-obsidian-task',

    config = function()
      require('tasknote').setup {
        global_filter = '#task',
        keymaps = {
          handle_input = { '<CR>' },
          submit = { '<C-s>' },
        },
        statuses = {
          { command = 'TaskToggleInProgress', symbol = '/', append = ' ' },
          { command = 'TaskToggleDone', symbol = 'x', append = '[completed:: today' },
          { command = 'TaskToggleCancelled', symbol = '-', append = '[cancelled:: today]' },
        },
      }
    end,
  },
}
