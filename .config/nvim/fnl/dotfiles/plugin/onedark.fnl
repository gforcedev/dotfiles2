(module dotfiles.plugin.onedark
  {autoload {nvim aniseed.nvim
             onedark onedark}})

(onedark.setup)
(nvim.ex.colorscheme :onedark)
