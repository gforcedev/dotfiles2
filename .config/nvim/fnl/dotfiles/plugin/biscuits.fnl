(module dotfiles.plugin.biscuits
  {autoload {biscuits nvim-biscuits}})

(biscuits.setup {:max_length 50
                 :min_distance 5
                 :prefix_string "📎"
                 :toggle_keybind "<leader>bb"})

