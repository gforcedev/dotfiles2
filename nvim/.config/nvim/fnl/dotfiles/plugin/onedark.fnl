(module dotfiles.plugin.onedark
  {autoload {nvim aniseed.nvim
             onedark onedark}})

(onedark.setup {:style "dark"})
(nvim.ex.colorscheme :onedark)

(set nvim.o.termguicolors true)

