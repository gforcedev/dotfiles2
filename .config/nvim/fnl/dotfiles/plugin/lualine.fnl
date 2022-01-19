(module dotfiles.plugin.lualine
  {autoload {nvim aniseed.nvim}})

(nvim.ex.set "noshowmode")

(let [lualine (require :lualine)]
  (when lualine
    (lualine.setup
      {
       :options {
                 :icons_enabled true
                 :theme "onedark"
                 :component_separators ["" ""]
                 :section_separators ["" ""]
                 :disabled_filetypes []}
       :sections {
                  :lualine_a ["mode"]
                  :lualine_b ["filename"]
                  :lualine_c ["branch"]
                  :lualine_x ["encoding"]
                  :lualine_y ["fileformat" "filetype"]
                  :lualine_z ["location" "progress"]}
       :inactive_sections {
                           :lualine_a []
                           :lualine_b []
                           :lualine_c []
                           :lualine_x []
                           :lualine_y []
                           :lualine_z []}
       :tabline []
       :extensions []})))
