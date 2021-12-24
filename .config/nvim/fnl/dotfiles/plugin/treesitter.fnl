(module dotfiles.treesitter
  {autoload {treesitter nvim-treesitter.configs}})

(treesitter.setup
  {:ensure_installed ["json"
                      "javascript"
                      "typescript"
                      "php"
                      "yaml"
                      "clojure"
                      "fennel"]
   :highlight {:enable true
               :disable {}}
   :indent {:enable true}})
