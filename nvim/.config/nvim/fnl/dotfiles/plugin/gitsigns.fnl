(module dotfiles.plugin.gitsigns
  {autoload {nvim aniseed.nvim
             gitsigns gitsigns}})

(gitsigns.setup {:current_line_blame true
                 :current_line_blame_opts {:delay 200}})
