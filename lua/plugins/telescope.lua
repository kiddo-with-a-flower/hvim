
return {
   {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      dependencies = {
         'nvim-lua/plenary.nvim',
         'nvim-tree/nvim-tree.lua',
      },
      opts = {
         pickers = {
            find_files = {
               theme = 'dropdown',
               -- Show hidden files when using find command
               find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
            },
            live_grep = {
               theme = 'dropdown',
            },
            buffers = {
               theme = 'dropdown',
            },
            help_tags = {
               theme = 'dropdown',
            },
            oldfiles = {
               theme = 'dropdown',
            },
         },
      },
      config = function(_, opts)
         local telescope = require("telescope")
         local telescopeConfig = require("telescope.config")

         -- Clone the default Telescope configuration
         local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

         -- I want to search in hidden/dot files.
         table.insert(vimgrep_arguments, "--hidden")
         -- I don't want to search in the `.git` directory.
         table.insert(vimgrep_arguments, "--glob")
         table.insert(vimgrep_arguments, "!**/.git/*")

         -- Add to the opts
         opts.defaults = {
            vimgrep_arguments = vimgrep_arguments
         }
         telescope.setup(opts)
      end,
      keys = {
         {'<leader>t', desc = 'Telescope'},
         {'<leader>tf', function() require'nvim-tree.api'.tree.close(); require('telescope.builtin').find_files() end, desc = 'Find Files'},
         {'<leader>tg', function() require'nvim-tree.api'.tree.close(); require('telescope.builtin').live_grep() end, desc = 'Live Grep'},
         {'<leader>tc', function() require'nvim-tree.api'.tree.close(); require('telescope.builtin').commands() end, desc = 'Commands'},
         {'<leader>tb', function() require'nvim-tree.api'.tree.close(); require('telescope.builtin').buffers() end, desc = 'Buffers'},
         {'<leader>th', function() require'nvim-tree.api'.tree.close(); require('telescope.builtin').help_tags() end, desc = 'Help Tags'},
      }
   }
}
