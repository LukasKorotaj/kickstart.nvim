return {
  {
    dir = '~/randoms/create-obsidian-task-local',
    name = 'tasknote', -- Optional, helps with requiring
    dev = true,
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
