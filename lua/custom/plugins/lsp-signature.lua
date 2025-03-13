return {
  {
    'ray-x/lsp_signature.nvim',
    event = 'InsertEnter',
    opts = {
      hint_prefix = '🫠',
      bind = true,
      handler_opts = {
        border = 'rounded',
      },
      vim.keymap.set({ 'i' }, '<C-s>', function()
        require('lsp_signature').toggle_float_win()
      end, { silent = true, noremap = true, desc = 'toggle signature' }),
    },
    -- or use config
    config = function(_, opts)
      require('lsp_signature').setup(opts)
    end,
  },
}
