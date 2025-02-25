return {
  {
    dir = '~/random/luasnip-markdown-snippets.nvim',
    config = function()
      local ls = require 'luasnip'
      local autosnippet = ls.extend_decorator.apply(ls.snippet, { snippetType = 'autosnippet' })
      local t = ls.text_node
      local i = ls.insert_node
      local lms = require 'luasnip-markdown-snippets'
      local s = ls.snippet
      local fmta = require('luasnip.extras.fmt').fmta

      require('luasnip-markdown-snippets').setup {
        snippets = {
          markdown = {
            autosnippet({ trig = 'sr', wordTrig = false }, { t '^3' }, { condition = lms.in_math, show_condition = lms.in_math }),
            s({ trig = 'mk', name = 'Inline Math', dscr = 'Custom inline math' }, fmta('$<>$ <>', { i(1), i(0) })),
          },
        },
      }
    end,
  },
}
