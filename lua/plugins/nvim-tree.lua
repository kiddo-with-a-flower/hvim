return {
   {
      "nvim-tree/nvim-tree.lua",
      tag = "v1.13.0",
      lazy = false,
      init = function()
         -- disable netrw at the very start of your init.lua
         vim.g.loaded_netrw = 1
         vim.g.loaded_netrwPlugin = 1
         -- optionally enable 24-bit colour
         vim.opt.termguicolors = true
      end,
      keys = {
         {"<leader>e","<cmd>NvimTreeToggle<CR>", desc = "Nvim Tree Toggle"},
      },
      opts = {
         git = {
            enable = true,
         },
         renderer = {
            highlight_git = true,
            icons = {
               show = {
                  git = true,
               },
            },
         },
         view = {
            side = "left",
         },
      }
   }
}
