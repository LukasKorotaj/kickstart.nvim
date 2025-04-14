return {
  {
    'ray-x/lsp_signature.nvim',
    event = 'BufRead',
    opts = {
      floating_window_off_x = 5, -- adjust float windows x position.
      floating_window_off_y = function() -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
        local linenr = vim.api.nvim_win_get_cursor(0)[1] -- buf line number
        local pumheight = vim.o.pumheight
        local winline = vim.fn.winline() -- line number in the window
        local winheight = vim.fn.winheight(0)

        -- window top
        if winline - 1 < pumheight then
          return pumheight
        end

        -- window bottom
        if winheight - winline < pumheight then
          return -pumheight
        end
        return 0
      end,

      move_signature_window_key = { '<M-j>', '<M-k>' },
      hint_prefix = '🫠',
      bind = true,
      handler_opts = {
        border = 'rounded',
      },
    },
    config = function(_, opts)
      require('lsp_signature').setup(opts)
      -- Set keymap separately in the config function
      vim.keymap.set('i', '<C-s>', function()
        require('lsp_signature').toggle_float_win()
      end, { silent = true, noremap = true, desc = 'toggle signature' })
    end,
  },
}
