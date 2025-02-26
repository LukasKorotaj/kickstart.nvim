return {
  'LukasKorotaj/luasnip-markdown-snippets.nvim',
  config = function()
    local ls = require 'luasnip'
    local t = ls.text_node
    local i = ls.insert_node
    local fmta = require('luasnip.extras.fmt').fmta
    local autosnippet = ls.extend_decorator.apply(ls.snippet, { snippetType = 'autosnippet' })
    local lms = require 'luasnip-markdown-snippets'

    require('luasnip-markdown-snippets').setup {
      snippets = {
        markdown = {
          -- Override existing snippet
          autosnippet(
            { trig = 'cb', wordTrig = false },
            { t '^4' }, -- original was ^3
            { condition = lms.in_math }
          ),

          -- New test snippet
          ls.snippet(
            { trig = 'test', name = 'testing snippets', dscr = 'Test to check if new snippets work' },
            fmta(
              [[
		testing <>, it is <>.
            ]],
              { i(1), i(0) }
            )
          ),
        },
      },
    }
  end,
}
