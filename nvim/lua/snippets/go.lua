local ls = require("luasnip")
local snippet = ls.snippet
local insert = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("go", {
  snippet("ifnull", fmt(
    [[
    if err != nil {
      <>
    }
    ]],
    { insert(1) },
    { delimiters = "<>" }
  )),
})
