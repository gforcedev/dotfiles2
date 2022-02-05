(module dotfiles.mapping
  {autoload {nvim aniseed.nvim
             nu aniseed.nvim.util
             core aniseed.core}})

(defn- noremap [mode from to]
  "Sets a mapping with {:noremap true}."
  (nvim.set_keymap mode from to {:noremap true}))

;; Spacebar as leader
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader " ")

(noremap :n :<leader>bn ":bnext<cr>")
(noremap :n :<leader>bp ":bprev<cr>")
(noremap :n :<leader>tn ":tabnext<cr>")
(noremap :n :<leader>tp ":tabprev<cr>")
(noremap :n :<leader>tc ":tabclose<cr>")
(noremap :n :<leader>tt ":tab split<cr>")

