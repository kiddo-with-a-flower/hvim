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
