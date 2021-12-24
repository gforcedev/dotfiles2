(module dotfiles.core
  {autoload {nvim aniseed.nvim
             util dotfiles.util}})

; Generic config
(set nvim.o.title true)
(set nvim.o.termguicolors true)
(set nvim.o.mouse "a")
(set nvim.o.updatetime 500)
(set nvim.o.timeoutlen 500)
(set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")
(set nvim.o.inccommand :split) ; For more interactive :s
(set nvim.o.number true)
(set nvim.o.tabstop 4)
(set nvim.o.shiftwidth 4)
(nvim.ex.set "formatoptions+=o")

; Split after rather than before
(set nvim.o.splitright true)
(set nvim.o.splitbelow true)

; Yank modifications
(nvim.ex.set "clipboard+=unnamedplus")
(util.nnoremap-nocmd :x "\"_x")
(util.vnoremap-nocmd :x "\"_x")

; QF list moving
(util.nnoremap :<c-j> "cnext")
(util.nnoremap :<c-k> "cprev")

