(module dotfiles.plugin.sidebar
  {autoload {nvim aniseed.nvim
             util dotfiles.util
             sidebar sidebar-nvim}})

(sidebar.setup {:open true
                :sections ["git" "diagnostics" "symbols" "files"]})

(util.nnoremap :<C-n> "SidebarNvimToggle")
(util.nnoremap :<C-m-h> "SidebarNvimFocus")

