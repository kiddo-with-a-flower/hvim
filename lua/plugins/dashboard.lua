local ascii_art = {
' ▄▄                    ▄▄                   ',
'███                    ██                   ',
' ██                                         ',
' ███████▄ ▀██▀   ▀██▀▀███ ▀████████▄█████▄  ',
' ██    ██   ██   ▄█    ██   ██    ██    ██  ',
' ██    ██    ██ ▄█     ██   ██    ██    ██  ',
' ██    ██     ███      ██   ██    ██    ██  ',
'████  ████▄    █     ▄████▄████  ████  ████▄',
'',
'',
}

-- local function split_string(input)
--     local result = {}
--     for line in input:gmatch("[^\n]+") do
--         table.insert(result, line)
--     end
--     return result
-- end

return {
   -- {
   --    'MaximilianLloyd/ascii.nvim',
   --    dependencies = {
   --       'MunifTanjim/nui.nvim',
   --    },
   -- },
   {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      opts = {
         theme = 'doom',
         config = {
            header = ascii_art,
            footer = {'HelloOoooOoo 👻'}, -- footer
            center = {
               { action = function() require('telescope.builtin').find_files() end,
                  desc = ' Find File  ', icon = '🔍 ', key = 'f' },
               { action = function() require('telescope.builtin').oldfiles() end,
               desc = ' Recent Files', icon = '📄 ', key = 'r' },
               { action = function() require('telescope.builtin').live_grep() end,
                  desc = ' Find Text  ', icon = '🔦 ', key = 's' },
               { action = 'Lazy update', desc = ' Update Plugins', icon = '💣 ', key = 'u' },
               { action = 'qa', desc = ' Quit Neovim  ', icon = '❌ ', key = 'q'}
            },
            vertical_center = true
         },
         hide = {
            tabline = true,
            statusline = true,
         },
      },
      dependencies = {
         'nvim-tree/nvim-web-devicons',
         'nvim-telescope/telescope.nvim',
         -- 'MaximilianLloyd/ascii.nvim',
      }
   }
}
