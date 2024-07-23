local ls = require("luasnip")
local snippet = ls.snippet
-- local text = ls.text_node
local insert = ls.insert_node

local extras = require("luasnip.extras")
local rep = extras.rep

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("dart", {
  snippet("stl", fmt(
    [[
        class <> extends StatelessWidget {
          const <>({Key? key}) : super(key: key);

          @override
          Widget build(BuildContext context) {
            return Container();
          }
        }
        ]],
    { insert(1), rep(1) },
    { delimiters = "<>" }
  )),
  snippet("stf", fmt(
    [[
        class $% extends StatefulWidget {
          const $%({Key? key}) : super(key: key);

          @override
          State<$%> createState() => _$%State();
        }

        class _$%State extends State<$%> {
          @override
          Widget build(BuildContext context) {
            return Container();
          }
        }
        ]],
    { insert(1), rep(1), rep(1), rep(1), rep(1), rep(1) },
    { delimiters = "$%" }
  ))
})
