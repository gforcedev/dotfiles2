(module dotfiles.plugin.vim-tmux-navigator
  {autoload {nvim aniseed.nvim
             util dotfiles.util}})

(set nvim.g.tmux_navigator_no_mappings true)

(util.nnoremap :<m-h> "TmuxNavigateLeft")
(util.nnoremap :<m-j> "TmuxNavigateDown")
(util.nnoremap :<m-k> "TmuxNavigateUp")
(util.nnoremap :<m-l> "TmuxNavigateRight")
