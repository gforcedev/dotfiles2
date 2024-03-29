(module dotfiles.plugin.lspconfig
  {autoload {util dotfiles.util
             nvim aniseed.nvim}})

(let [lsp (require :lspconfig)]
  (when lsp
    (lsp.clojure_lsp.setup {})
    (lsp.gopls.setup
      {:settings {:gopls {:analyses {:nilness true
                                     :unusedwrite true}
                          :gofumpt true}}})
    (lsp.golangci_lint_ls.setup {:init_options {:command ["golangci-lint" "run" "--enable-all" "--disable" "lll" "--out-format" "json"]}})
    (lsp.tsserver.setup {})
    (lsp.svelte.setup {})
    (lsp.prismals.setup {})
    (lsp.tailwindcss.setup {})
    (lsp.perlnavigator.setup {:cmd ["perlnavigator" "--stdio"]})
    (lsp.diagnosticls.setup
      {:filetypes ["javascript" "javascriptreact" "typescript" "typescriptreact" "css" "bash" "sh"]
       :init_options {
                      :filetypes {
                                  :bash "shellcheck"
                                  :sh "shellcheck"
                                  :javascript "eslint"
                                  :typescript "eslint"
                                  :javascriptreact "eslint"
                                  :typescriptreact "eslint"}
                      :linters {
                                :shellcheck {:sourceName "shellcheck"
                                             :command "shellcheck"
                                             :debounce 100
                                             :args ["--format" "json1" "-"]
                                             :parseJson {:errorsRoot "comments"
                                                         :sourceName "file"
                                                         :line "line"
                                                         :endLine "endLine"
                                                         :endColumn "endColumn"
                                                         :security "level"
                                                         :message "[shellcheck] ${message} [SC${code}]"}
                                             :securities {:error "error"
                                                          :warning "warning"
                                                          :info "info"
                                                          :style "hint"}}
                                :eslint {:sourceName "eslint"
                                         :command "node_modules/eslint/bin/eslint.js"
                                         :rootPatterns [".eslintrc.js" ".eslintrc.json" ".eslintrc" "package.json"]
                                         :debounce 100
                                         :args ["--stdin"
                                                "--stdin-filename"
                                                "%filepath"
                                                "--format"
                                                "json"]
                                         :parseJson {:errorsRoot "[0].messages"
                                                     :line "line"
                                                     :column "column"
                                                     :endLine "endline"
                                                     :endColumn "endColumn"
                                                     :message "${message} [${ruleId}]"
                                                     :security "severity"}
                                         :securities {2 "error"
                                                      1 "warning"}}}}})))

(util.nnoremap :gd "lua vim.lsp.buf.definition()")
(util.nnoremap :K "lua vim.lsp.buf.hover()")
(util.lnnoremap :ld "lua vim.diagnostic.open_float()")
(util.lnnoremap :la "lua vim.lsp.buf.code_action()")
(util.nnoremap "<F2>" "lua vim.lsp.buf.rename()")

; Some langs I'm currently using lsp format on save rather than neoformat
(nvim.ex.autocmd "BufWritePre *.go,*.prisma lua vim.lsp.buf.formatting_sync()")

; I don't have a better place to put these rn and not having them is annoying
(nvim.ex.autocmd "BufReadPre,FileReadPre *.js,*.ts,*.jsx,*.tsx,*.json set tabstop=2 shiftwidth=2 expandtab")
