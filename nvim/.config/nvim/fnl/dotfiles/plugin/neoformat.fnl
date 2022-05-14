(module dotfiles.plugin.gitsigns
  {autoload {nvim aniseed.nvim}})

; Should use prettier
(nvim.ex.autocmd "BufWritePre *.js,*.jsx,*.ts,*.tsx Neoformat")
; Should use gofumports
(nvim.ex.autocmd "BufWritePre *.go Neoformat")
