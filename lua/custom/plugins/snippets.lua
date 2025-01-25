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
  ls.add_snippets('markdown', {
    s(
      'table',
      fmt(
        [[
      | {} | {} |
      | --- | --- |
      | {} | {} |
    ]],
        {
          i(1, 'Column 1'),
          i(2, 'Column 2'),
          i(3, 'Row 1'),
          i(4, 'Row 2'),
        }
      )
    ),
    s(
      'code',
      fmt(
        [[
      ```{}
      {}
      ```
    ]],
        {
          i(1, 'language'),
          i(2, 'Your code'),
        }
      )
    ),
    s('date', { t(os.date '%d-%m-%Y') }),
    s(
      'math',
      fmt(
        [[
      $$
      {}
      $$
    ]],
        {
          i(1, 'Math expression'),
        }
      )
    ),
    s(
      'quote',
      fmt(
        [[
      > "{}" 
      > — {}
    ]],
        {
          i(1, 'Quote goes here'), -- Placeholder for the quote
          i(2, 'Author or Source'), -- Placeholder for the author or source
        }
      )
    ),
    s(
      'comment',
      fmt(
        [[
      %%=={}==%%
    ]],
        {
          i(1, 'Comment goes here'),
        }
      )
    ),
    s(
      'test',
      fmt(
        [[
        {}
    ]],
        {
          i(1, 'test'),
        }
      )
    ),
  }),
}
