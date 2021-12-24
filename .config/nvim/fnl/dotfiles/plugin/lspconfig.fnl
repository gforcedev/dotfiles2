(module dotfiles.plugin.lspconfig
  {autoload {util dotfiles.util
             nvim aniseed.nvim}})

(let [lsp (require :lspconfig)]
  (when lsp
    (lsp.clojure_lsp.setup {})
    (lsp.tsserver.setup {})
    (lsp.svelte.setup {})
    (lsp.diagnosticls.setup
      {:filetypes ["javascript" "javascriptreact" "typescript" "typescriptreact" "css"]
       :init_options {
                      :filetypes {
                                  :javascript "eslint"
                                  :typescript "eslint"
                                  :javascriptreact "eslint"
                                  :typescriptreact "eslint"}
                      :linters {
                                :eslint {
                                         :sourceName "eslint"
                                         :command "./node_modules/.bin/eslint"
                                         :rootPatterns [".eslintrc.js" "package.json"]
                                         :debounce 100
                                         :args [
                                                "--cache"
                                                "--stdin"
                                                "--stdin-filename"
                                                "%filepath"
                                                "--format"
                                                "json"]
                                         :parseJson {
                                                     :errorsRoot "[0].messages"
                                                     :line "line"
                                                     :column "column"
                                                     :endLine "endline"
                                                     :endColumn "endColumn"
                                                     :message "${message} [${ruleId}]"
                                                     :security "severity"}
                                         :securities {
                                                      [2] "error"
                                                      [1] "warning"}}
                                }
                      }})
    ))
