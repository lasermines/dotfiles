return {
   -- Telescope setup
   {
       "nvim-telescope/telescope.nvim",
       tag = '0.1.8',
       dependencies = { 
           'nvim-lua/plenary.nvim',
           {
               'nvim-telescope/telescope-fzf-native.nvim',
               build = 'make'
           }
       },
       config = function()
           local telescope = require('telescope')
           local actions = require('telescope.actions')
           
           telescope.setup {
               defaults = {
                   mappings = {
                       i = {
                           ["<C-j>"] = actions.move_selection_next,
                           ["<C-k>"] = actions.move_selection_previous,
                           ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                           ["<C-x>"] = actions.delete_buffer
                       },
                   },
                   file_ignore_patterns = {
                       "node_modules",
                       ".git/",
                       "target/",
                       "dist/",
                       "build/",
                       "%.lock"
                   },
                   vimgrep_arguments = {
                       "rg",
                       "--color=never",
                       "--no-heading",
                       "--with-filename",
                       "--line-number",
                       "--column",
                       "--smart-case",
                       "--hidden"
                   }
               },
               pickers = {
                   find_files = {
                       hidden = true,
                       previewer = true,
                       layout_config = {
                           height = 88
                       }
                   },
                   buffers = {
                       show_all_buffers = true,
                       previewer = true,
                       layout_config = {
                           height = 0.4
                       }
                   }
               },
               extensions = {
                   fzf = {
                       fuzzy = true,
                       override_generic_sorter = true,
                       override_file_sorter = true,
                       case_mode = "smart_case"
                   }
               }
           }

           -- Load extensions
           telescope.load_extension('fzf')
       end,
   },
}