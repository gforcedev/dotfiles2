(module dotfiles.plugin.luasnip
  {autoload {util dotfiles.util
             vsc-loader luasnip.loaders.from_vscode}})

(vsc-loader.load {:paths ["snippets-gforcedev"]})

