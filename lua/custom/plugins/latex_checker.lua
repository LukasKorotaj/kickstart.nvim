local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local ts = vim.treesitter
--
--function Is_latex_block_under_cursor()
--  local bufnr = vim.api.nvim_get_current_buf()
--  local cursor = vim.api.nvim_win_get_cursor(0)
--  local row, col = unpack(cursor)
--
--  -- Ensure Treesitter is loaded
--  local ts = vim.treesitter
--  if not ts then
--    error('Treesitter not loaded', 2)
--  end
--
--  -- Get the parser for the current buffer
--  local parser = ts.get_parser(bufnr, 'markdown')
--  if not parser then
--    error('Parser not found for markdown. Ensure the Markdown parser is installed with :TSInstall markdown', 2)
--  end
--
--  -- Parse the buffer
--  local tree = parser:parse()[1]
--  local root = tree:root()
--
--  -- Define the query for LaTeX blocks
--  local query = ts.query.get('markdown', 'latex_block') -- Use 'highlights' or a custom query
--  if not query then
--    error('Failed to load query for markdown', 2)
--  end
--
--  -- Iterate over captures
--  for id, node in query:iter_captures(root, bufnr, row, row + 1) do
--    local capture_name = query.captures[id]
--    if capture_name == 'latex_block' then
--      local sr, sc, er, ec = node:range()
--      if sr <= row and row <= er and sc <= col and col <= ec then
--        return true
--      end
--    end
--  end
--
--  return false
--end
--
----function Is_latex_block_under_cursor()
----  local bufnr = vim.api.nvim_get_current_buf()
----  local cursor = vim.api.nvim_win_get_cursor(0)
----  local row, col = unpack(cursor)
----
----  local parser = ts.get_parser(bufnr, 'markdown')
----  if not parser then
----    error('Parser not found for markdown', 2)
----  end
----
----  local tree = parser:parse()[1]
----  local root = tree:root()
----  print(vim.inspect(root))
----
----  local tablequery = vim.treesitter.query.parse('markdown_inline', '(latex_block) @spell')
----  local query = unpack(tablequery)
----  if not query then
----    error('query failed to parse', 2)
----  end
----
----  for _, node in query:iter_captures(root, bufnr, row, row + 1) do
----    local sr, sc, er, ec = node:range()
----    print(string.format('Captured latex_block at range: (%d, %d) - (%d, %d)', sr, sc, er, ec))
----    if sr <= row and row <= er and sc <= col and col <= ec then
----      return true
----    end
----  end
----
----  return false
----end
--
local function is_latex_block_under_cursor()
  local ts = vim.treesitter
  local bufnr = vim.api.nvim_get_current_buf()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row, col = unpack(cursor)
  row = row - 1 -- 0-based

  -- Get inline parser
  local inline_parser = ts.get_parser(bufnr, 'markdown_inline', {})
  if not inline_parser then
    return false
  end

  -- Parse syntax tree
  inline_parser:parse()

  -- Define query
  local query_str = [[(latex_block) @latex_block]]
  local ok, query = pcall(ts.query.parse, 'markdown_inline', query_str)
  if not ok or not query then
    return false
  end

  -- Get root node
  local root = inline_parser:trees()[1]:root()
  if not root then
    return false
  end

  -- Check captures
  for _, node in query:iter_captures(root, bufnr, row, row + 1) do
    local sr, sc, er, ec = node:range()
    if sr <= row and row <= er then
      local valid_col = (row == sr and col >= sc) or (row == er and col <= ec) or (row > sr and row < er)

      if valid_col then
        return true
      end
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
