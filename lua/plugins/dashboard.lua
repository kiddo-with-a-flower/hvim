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

-- Table of emojis
local emojis = {
    "💣", "👻", "💸", "🕵️", "😎", "🤖", "🌟", "🍕", "🎉", "❤️", "❄️", "🍆"
}

math.randomseed(os.time())  -- Seed the random number generator

-- Function to get a random emoji
local function get_random_emoji()
    local index = math.random(1, #emojis)  -- Get a random index
    return emojis[index]  -- Return the emoji at that index
end

-- Function to split a string into lines based on maximum length
local function split_string_into_lines(input_string, max_length)
    local words = {}
    for word in input_string:gmatch("%S+") do  -- Split the string into words
        table.insert(words, word)
    end

    local lines = {}
    local current_line = ""

    for _, word in ipairs(words) do
        if #current_line + #word + 1 > max_length then
            table.insert(lines, current_line)  -- Add the current line to the lines table
            current_line = word  -- Start a new line with the current word
        else
            if current_line ~= "" then
                current_line = current_line .. " " .. word  -- Add the word to the current line
            else
                current_line = word  -- Start the line with the first word
            end
        end
    end

    if current_line ~= "" then
        table.insert(lines, current_line)  -- Add the last line if it exists
    end

    return lines
end

return {
   {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      opts = {
         theme = 'doom',
         config = {
            header = ascii_art,
            footer = function()
               local quote = require('famous-quotes').get_quote()[1]
               local footer_table = split_string_into_lines(quote.quote, vim.api.nvim_win_get_width(0) / 3)
               table.insert(footer_table, '- ' .. quote.author .. ' ' .. get_random_emoji())
               return footer_table
            end,
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
         'mahyarmirrashed/famous-quotes.nvim'
      }
   }
}
