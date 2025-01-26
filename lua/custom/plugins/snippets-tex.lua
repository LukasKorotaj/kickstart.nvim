local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta

return {
  ls.add_snippets('markdown', {
    s(
      'frac',
      fmt(
        [[
        /fraq{{{}}}{{{}}}
    ]],
        {
          i(1, 'jedan'),
          i(2, 'dva'),
        }
      )
    ),
  }),
}
