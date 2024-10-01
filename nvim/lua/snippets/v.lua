local ls = require("luasnip")
local snippet = ls.snippet
local insert = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("v", {
  snippet("fn", fmt(
    [[
    fn <>(<>) <> {
      <>
    }
    ]],
    { insert(1), insert(2), insert(3), insert(4) },
    { delimiters = "<>" }
  )),
  snippet("main", fmt(
    [[
    fn main() {
      <>
    }
    ]],
    { insert(1) },
    { delimiters = "<>" }
  )),
  snippet("if", fmt(
    [[
    if <> {
      <>
    }
    ]],
    { insert(1), insert(2) },
    { delimiters = "<>" }
  )),
  snippet("ifelse", fmt(
    [[
    if <> {
      <>
    } else {
      <>
    }
    ]],
    { insert(1), insert(2), insert(3) },
    { delimiters = "<>" }
  )),
  snippet("match", fmt(
    [[
    match <> {
      <>
    }
    ]],
    { insert(1), insert(2) },
    { delimiters = "<>" }
  )),
  snippet("for", fmt(
    [[
    for <> {
      <>
    }
    ]],
    { insert(1), insert(2) },
    { delimiters = "<>" }
  )),
  snippet("struct", fmt(
    [[
    struct {
      <>
    }
    ]],
    { insert(1) },
    { delimiters = "<>" }
  )),
})
