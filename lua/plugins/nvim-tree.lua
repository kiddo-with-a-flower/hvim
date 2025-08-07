-- This function shortly labels the current directory
-- to be readabe in the tree header
local function label(path)
  path = path:gsub(os.getenv 'HOME', '~', 1)
  return path:gsub('([a-zA-Z])[a-z0-9]+', '%1') ..
    (path:match '[a-zA-Z]([a-z0-9]*)$' or '')
end

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
         {"<leader>e",
         function()
            local api = require 'nvim-tree.api'
            api.tree.toggle({find_file = true})
         end
         , desc = "Nvim Tree Toggle"},
      },
      opts = {
         git = {
            enable = true,
         },
         filters = {
            git_ignored = false,
            custom = {
               '^\\.cache$',
               '^\\.git$',
            }
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
         sync_root_with_cwd = true,
         respect_buf_cwd = true,
         update_focused_file = {
            enable = true,
            update_root = true
         },
      },
      config = function(_, opts)
         -- This script clars the status line in the nvim-tree buffer,
         -- this is needed because the window is very thight
         local nt = require 'nvim-tree'
         local api = require 'nvim-tree.api'

         -- Label function to make folders paths shorter
         opts.renderer.root_folder_label = label
         opts.renderer.group_empty = label
         nt.setup(opts)
         api.events.subscribe(api.events.Event.TreeOpen,
         function()
            local tree_winid = api.tree.winid()

            if tree_winid ~= nil then
               vim.api.nvim_set_option_value('statusline', '%t', {win = tree_winid})
            end
         end)
         vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
            callback = function(ev)
               api.tree.find_file()
            end
         })
      end,
   }
}
