(module dotfiles.plugin.telescope
  {autoload {nvim aniseed.nvim
             util dotfiles.util
             telescope telescope
             actions telescope.actions
             sorters telescope.sorters
             previewers telescope.previewers}})

(telescope.setup
  {:defaults {
              :file_sorter sorters.get_fzy_sorter
              :color_devicons true
              :file_previewer previewers.vim_buffer_cat.new
              :grep_previewer previewers.vim_buffer_vimgrep.new
              :vimgrep_arguments ["rg" "--color=never" "--no-heading"
                                  "--with-filename" "--line-number" "--column"
                                  "--smart-case" "--hidden" "--follow"
                                  "-g" "!.git/"]
              :mappings {
                         :i {
                             :<C-j> actions.move_selection_next
                             :<C-k> actions.move_selection_previous
                             :<C-s> actions.select_vertical
                             :<C-i> actions.select_horizontal
                             :<esc> actions.close
                             }
                         }
              :extensions {
                           :fzy_native {
                                        :override_generic_sorter true
                                        :override_file_sorter true
                                        }
                           }
              }
   })

(util.nnoremap :<C-p> "Telescope find_files")
(util.lnnoremap :fb "Telescope file_browser")
(util.lnnoremap :fg "Telescope live_grep")
(util.lnnoremap :bs "Telescope buffers")
(util.lnnoremap :* "Telescope grep_string")
(util.lnnoremap :fH "Telescope help_tags")
(util.lnnoremap :fm "Telescope keymaps")
(util.lnnoremap :fM "Telescope marks")
(util.lnnoremap :fh "Telescope oldfiles")
(util.lnnoremap :ft "Telescope filetypes")
(util.lnnoremap :fc "Telescope commands")
(util.lnnoremap :fC "Telescope command_history")
(util.lnnoremap :fq "Telescope quickfix")
(util.lnnoremap :fl "Telescope loclist")
(util.lnnoremap :fsa "Telescope lsp_code_actions")
(util.lnnoremap :fsi "Telescope lsp_implementations")
(util.lnnoremap :fsr "Telescope lsp_references")
(util.lnnoremap :fsS "Telescope lsp_document_symbols")
(util.lnnoremap :fss "Telescope lsp_workspace_symbols")
(util.lnnoremap "f," "Telescope find_files cwd=~/.config/nvim")
