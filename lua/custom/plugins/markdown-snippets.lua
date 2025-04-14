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
    s(
      {
        trig = 'tikz',
        name = 'Tikz-block',
        descr = 'Creates a Tikz block in Obsidian',
      },
      fmta(
        [[
        ```tikz
        \begin{document}
          \begin{tikzpicture}
          <>
          \end{tikzpicture}
        \end{document}
        ```
    ]],
        {
          i(1, 'Tikz-stuff'),
        }
      )
    ),
    s(
      {
        trig = 'grid',
        name = 'Grid',
        descr = 'Makes a Tikz grid',
      },
      fmta(
        [[
        \draw[step=1cm,gray,very thin] (-1.9,-1.9) grid (5.9,5.9);
        <>
    ]],
        {
          i(1, ''),
        }
      )
    ),
  }),
}
