(module dotfiles.plugin.harpoon
  {autoload {core aniseed.core
             util dotfiles.util
             nvim aniseed.nvim
             harpoon harpoon}})

(harpoon.setup)

(util.nnoremap :<M-y>  "lua require(\"harpoon.ui\").toggle_quick_menu()")
(util.nnoremap "<M-;>" "lua require(\"harpoon.mark\").add_file()")

(util.nnoremap :<M-u> "lua require(\"harpoon.ui\").nav_file(1)")
(util.nnoremap :<M-i> "lua require(\"harpoon.ui\").nav_file(2)")
(util.nnoremap :<M-o> "lua require(\"harpoon.ui\").nav_file(3)")
(util.nnoremap :<M-p> "lua require(\"harpoon.ui\").nav_file(4)")
