(module dotfiles.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             util dotfiles.util
             packer packer}})

(defn safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :dotfiles.plugin. name))]
    (when (not ok?)
      (print (.. "dotfiles error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name)))))))
  nil)

(use
  :wbthomason/packer.nvim {}

  ; LISP things
  :Olical/aniseed {}
  :Olical/conjure {}
  :tpope/vim-dispatch {}
  :clojure-vim/vim-jack-in {}
  :radenling/vim-dispatch-neovim {}

  ; Appearance
  :navarasu/onedark.nvim {:mod :onedark}
  :hoob3rt/lualine.nvim {:mod :lualine}

  ; Git management
  :airblade/vim-gitgutter {}
  :tpope/vim-fugitive {}
  :tpope/vim-rhubarb {}
  :shumphrey/fugitive-gitlab.vim {:mod :fugitive-gitlab}

  ; Editor behaviour
  :jiangmiao/auto-pairs {:mod :auto-pairs}
  :lewis6991/impatient.nvim {}
  :tommcdo/vim-lion {:mod :vim-lion}
  :scrooloose/nerdcommenter {:mod :nerdcommenter}
  :christoomey/vim-tmux-navigator {:mod :vim-tmux-navigator}
  :tpope/vim-surround {}
  :mattn/emmet-vim {}
  :thekelvinliu/kwbd {:mod :kwbd}
  :guns/vim-sexp {:mod :sexp}
  :tpope/vim-sexp-mappings-for-regular-people {}

  ; Language plugins
  :leafOfTree/vim-svelte-plugin {}

  ; Own feature things
  :nvim-telescope/telescope.nvim {:mod :telescope :requires [[:nvim-lua/popup.nvim] [:nvim-lua/plenary.nvim]]}
  :ThePrimeagen/harpoon {:mod :harpoon}
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate" :mod :treesitter}
  :neovim/nvim-lspconfig {:mod :lspconfig}
  :hrsh7th/cmp-nvim-lsp {}
  :hrsh7th/cmp-buffer {}
  :hrsh7th/cmp-path {}
  :hrsh7th/cmp-cmdline {}
  :PaterJason/cmp-conjure {}
  :hrsh7th/nvim-cmp {:mod :cmp}
  :sidebar-nvim/sidebar.nvim {:mod :sidebar}
  )
