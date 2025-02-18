return {
  {
    'LukasKorotaj/create-obsidian-task',

    config = function()
      require('tasknote').setup {
        global_filter = '#task',
        keymaps = {
          handle_input = { '<CR>' },
          submit = { '<C-s>' },
        },
      }
    end,
  },
}
