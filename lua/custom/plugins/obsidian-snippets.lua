local ls = require 'luasnip'
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta
local s = ls.snippet

return {
  ls.add_snippets('markdown', {
    s(
      {
        trig = 'code',
        name = 'Code Block',
        descr = 'Creates a code block in Obsidian',
      },
      fmta(
        [[
        ```<>
        <>
        ```
    ]],
        {
          i(1, 'Language'),
          i(2, 'Code'),
        }
      )
    ),
    s(
      {
        trig = 'flowchart',
        name = 'Flow chart',
        descr = 'Creates a mermaid flow chart',
      },
      fmta(
        [[
        ```mermaid
        flowchart LR
        <>
        ```
    ]],
        {
          i(1, 'chart'),
        }
      )
    ),
    s(
      {
        trig = 'table',
        name = 'Table',
        descr = 'Creates a table',
      },
      fmta(
        [[
        |<>|<>|
        |---|---|
        |<>|<>|
    ]],
        {
          i(1, 'Column one'),
          i(2, 'Column two'),
          i(3, 'Content one'),
          i(4, 'Content two'),
        }
      )
    ),
  }),
}
