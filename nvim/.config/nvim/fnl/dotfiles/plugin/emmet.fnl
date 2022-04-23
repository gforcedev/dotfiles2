(module dotfiles.plugin.emmet
  {autoload {util dotfiles.util}})

(util.inoremap-nocmd :<C-l> "<Plug>(emmet-expand-word)")
