(module dotfiles.plugin.cmp
  {autoload {nvim aniseed.nvim
             cmp cmp}})

(nvim.ex.set "completeopt=menu,menuone,noselect")

(def- icons {:Text          ""
             :Method        ""
             :Function      ""
             :Constructor   ""
             :Field         "ﰠ"
             :Variable      ""
             :Class         "ﴯ"
             :Interface     ""
             :Module        ""
             :Property      "ﰠ"
             :Unit          "塞"
             :Value         ""
             :Enum          ""
             :Keyword       ""
             :Snippet       ""
             :Color         ""
             :File          ""
             :Reference     ""
             :Folder        ""
             :EnumMember    ""
             :Constant      ""
             :Struct        "פּ"
             :Event         ""
             :Operator      ""
             :TypeParameter ""})

(def- cmp-src-menu-items
  {:buffer "buff"
   :conjure "conj"
   :nvim_lsp "lsp"
   :path "path"
   :nvim_lua "lua"})

(def- cmp-srcs
  [{:name :nvim_lsp}
   {:name :conjure}
   {:name :nvim_lua}
   {:name :path}
   {:name :buffer}])

(cmp.setup {:formatting
            {:format (fn [entry item]
                       (set item.menu (or (. cmp-src-menu-items entry.source.name) ""))
                       (set item.kind (or (. icons item.kind) ""))
                       item)}
            :mapping {:<Tab> (cmp.mapping.select_next_item)
                      :<S-Tab> (cmp.mapping.select_prev_item)
                      :<C-b> (cmp.mapping.scroll_docs (- 4))
                      :<C-f> (cmp.mapping.scroll_docs 4)
                      :<C-Space> (cmp.mapping.complete)
                      :<C-e> (cmp.mapping.close)
                      :<CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert
                                                  :select true})}
            :sources cmp-srcs})

(cmp.setup.cmdline "/" {:sources [{:name "buffer"}]})
(cmp.setup.cmdline ":" {:sources [{:name "path"} {:name "cmdline"}]})

