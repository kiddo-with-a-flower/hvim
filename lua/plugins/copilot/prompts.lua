return {
   ["Create Readme"] = {
      strategy = "chat",
      description = "Write a README.md for me",
      opts = {
         is_slash_cmd = false,
         auto_submit = true,
         short_name = "readme",
      },
      context = {
         {
            -- WARN: This does not work yet, I'm having issues understanding how context works in codecompanion prompts.
            --       Should I use MCP or vectorization??? (Ask Federico)
            type = "file",
            path = {
              "lua/",
            },
         },
      },
      prompts = {
         {
           role = "system",
           content = function(context)
             return "I want you to act as an experienced "
               .. context.filetype
               .. " developer. I will ask you to produce documentation for a project that will be shared on a on-premise GitLab and Artifactory platform."
           end,
         },
         {
            role = "user",
            content = function(context)
               local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

               return "Given the context "
                  .. text
                  .. "\n"
                  .. "I want you to generate a possible README.md"
               end,
         },
      },
    },
}
