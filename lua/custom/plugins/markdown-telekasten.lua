return {
  {
    'renerocksai/telekasten.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-telekasten/calendar-vim', 'nvim-telescope/telescope-media-files.nvim' },
    opts = {
      home = vim.fn.expand '~/vaults/personal/University/',
      vaults = {
        plans = {
          home = vim.fn.expand '~/vaults/personal/Plans/',
        },
      },
    },
  },
}
