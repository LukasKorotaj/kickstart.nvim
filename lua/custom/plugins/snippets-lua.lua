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
    s({{
      trig = '{}',
      name = '{}',
      descr = '{}',
    }}, 
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
          i(1, 'Trig'),
          i(2, 'Name'),
          i(3, 'Description'),
          i(4, 'Content'),
          i(5, 'Placeholder'),
        }
      )
    ),
    s(
      {
        trig = 'insert',
        name = 'insert_node',
        descr = 'Adds an insert node',
      },
      fmt(
        [[
    i({}, '{}'),
    ]],
        {
          i(1, 'Number'),
          i(2, 'Title'),
        }
      )
    ),
    s({
      trig = 'auto',
      name = 'autosnippet',
      descr = 'Makes an autosnippet type',
    }, {
      t { [[snippetType = 'autosnippet',]] },
    }),
    s({
      trig = 'inword',
      name = 'wordTrig',
      descr = 'disables wordTrig',
    }, {
      t { [[wordTrig = false,]] },
    }),

    s(
      {
        trig = 'text',
        name = 'text_node',
        descr = 'Creates a text node',
      },
      fmt([[ t {{ '{}' }}, ]], {
        i(1, 'Text'),
      })
    ),
  }),
}
