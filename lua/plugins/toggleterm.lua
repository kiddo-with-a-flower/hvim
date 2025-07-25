-- Function to toggle floating terminal
function toggle_floating_terminal()
   local term = require("toggleterm.terminal").Terminal
   if not float_term then
       float_term = term:new({ direction = "float" })
   end

   if float_term:is_open() then
     float_term:close()
   else
     float_term:open()
   end
end

return {
   {
      'akinsho/toggleterm.nvim',
      tag = "v2.13.1",
      keys = {
         {"<C-\\>", "<cmd>lua toggle_floating_terminal()<CR>", mode = "n", desc = "Floating Terminal"},
         {"<C-\\>", "<cmd>lua toggle_floating_terminal()<CR>", mode = "t", desc = "Floating Terminal"},
      },
      opts = {}
   }
}
