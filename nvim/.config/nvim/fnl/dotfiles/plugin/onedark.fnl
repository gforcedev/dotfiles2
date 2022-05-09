(module dotfiles.plugin.onedark
  {autoload {nvim aniseed.nvim
             onedark onedark}})

(onedark.setup {:style "dark"
                :colors {:bg0 "#21252b"}}) ; Match exactly to the iterm theme

(nvim.ex.colorscheme :onedark)

(set nvim.o.termguicolors true)

