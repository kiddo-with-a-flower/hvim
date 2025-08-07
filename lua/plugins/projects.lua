return {
   {
      'ahmedkhalf/project.nvim',
      config = function()
         require("project_nvim").setup {
            patterns = { ".git", "package.json" },
            -- Show hidden files in telescope
            show_hidden = true,
         }
      end,
   },
   {
      's1n7ax/nvim-search-and-replace',
      opts = {
         -- keymap for search and replace
         replace_keymap = '<leader>R',
         -- keymap for search and replace ( this does not care about ignored files )
         replace_all_keymap = '<leader>Ra',
         -- keymap for search and replace
         replace_and_save_keymap = '<leader>Rs',
         -- keymap for search and replace ( this does not care about ignored files )
         replace_all_and_save_keymap = '<leader>Rsa',
      },
   }
}
