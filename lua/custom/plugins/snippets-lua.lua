local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta

return {
  ls.add_snippets('lua', {
    s(
      'snippet',
      fmt(
        [=[
      s(
        '{}',
        fmt(
          [[
          {}
      ]],
          {{
            i(1, '{}'),
          }}
        )
      ),
    ]=],
        {
          i(1, 'Name'),
          i(2, 'Content'),
          i(3, 'Placeholder'),
        }
      )
    ),
  }),
}
