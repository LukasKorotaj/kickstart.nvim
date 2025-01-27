-- latex_checker.luasss
local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local ts = vim.treesitter

local function is_latex_block_under_cursor()
  local bufnr = vim.api.nvim_get_current_buf()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row, col = cursor[1] - 1, cursor[2]

  local parser = ts.get_parser(bufnr, 'markdown')
  if not parser then
    error('Parser not found for markdown', 2)
  end

  local tree = parser:parse()[1]
  local root = tree:root()

  local query = vim.treesitter.query.parse('markdown_inline', '(latex_block) @block')

  for _, node in query:iter_captures(root, bufnr, row, row + 1) do
    local sr, sc, er, ec = node:range()
    print(string.format('Captured latex_block at range: (%d, %d) - (%d, %d)', sr, sc, er, ec))
    if sr <= row and row <= er and sc <= col and col <= ec then
      return true
    end
  end

  return false
end

return {
  ls.add_snippets('markdown', {
    s({
      trig = 'eq',
      name = 'Equation',
      dscr = 'Insert a LaTeX equation block',
      condition = function()
        return is_latex_block_under_cursor()
      end,
    }, {
      t { 'test' },
    }),
  }),
}
