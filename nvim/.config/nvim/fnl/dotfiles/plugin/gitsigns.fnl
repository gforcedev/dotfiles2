(module dotfiles.plugin.gitsigns
  {autoload {nvim aniseed.nvim
             util dotfiles.util
             gitsigns gitsigns}})

(gitsigns.setup {:current_line_blame true
                 :current_line_blame_opts {:delay 200}})

(util.nnoremap "[c" "<cmd>Gitsigns prev_hunk<CR>")
(util.nnoremap "]c" "<cmd>Gitsigns next_hunk<CR>")
