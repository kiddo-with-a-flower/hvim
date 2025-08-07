return {
   {
      'UtkarshVerma/molokai.nvim',
      lazy = false,
      priority = 1000,
      opts = {
      },
      config = function(_,opts)
         vim.cmd[[colorscheme molokai]]
      end,
   },
}
