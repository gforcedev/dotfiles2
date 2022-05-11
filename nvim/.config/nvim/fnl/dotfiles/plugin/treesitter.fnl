(module dotfiles.treesitter
  {autoload {treesitter nvim-treesitter.configs}})

(treesitter.setup
  {:ensure_installed ["go"
                      "gomod"
                      "json"
                      "javascript"
                      "typescript"
                      "tsx"
                      "php"
                      "perl"
                      "yaml"
                      "clojure"
                      "fennel"]
   :highlight {:enable true
               :disable {}}
   :indent {:enable true}
   :refactor {:highlight_definitions {:enable true}}})
