local ls = require("luasnip")
local snippet = ls.snippet
local insert = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

-- go
ls.add_snippets("go", {
  snippet("iferr", fmt([[
    if err != nil {
      <>
    }
  ]], { insert(1) }, { delimiters = "<>" })),
  
  snippet("main", fmt([[
    func main() {
      <>
    }
  ]], { insert(1) }, { delimiters = "<>" }))
})

-- dart
ls.add_snippets("dart", {
  snippet("stl", fmt([[
    class <> extends StatelessWidget {
      const <>({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return Container();
      }
    }
  ]], { insert(1), rep(1) }, { delimiters = "<>" })),
  
  snippet("stf", fmt([[
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
  ]], { insert(1), rep(1), rep(1), rep(1), rep(1), rep(1) }, { delimiters = "$%" }))
})

-- vlang
ls.add_snippets("v", {
  snippet("fn", fmt([[
    fn <>(<>) <> {
      <>
    }
  ]], { insert(1), insert(2), insert(3), insert(4) }, { delimiters = "<>" })),
  
  snippet("main", fmt([[
    fn main() {
      <>
    }
  ]], { insert(1) }, { delimiters = "<>" }))
})

require("luasnip.loaders.from_vscode").lazy_load()