local M = {}

-- parse_http_files parses http files and returns table of requests
-- TODO write TESTS and more TESTS for this logic!
function M.parse_http_files(files)
   local requests = {}
   local id = 0

   for _, file in pairs(files) do
      for line in io.lines(file) do
         local seperator_start, _ = string.find(line, "###")
         local at_start, _ = string.find(line, "@")
         local label = ""
         local headers = {}

         -- variable declaration
         if at_start == 1 or at_start == 3 then
            -- TODO add variable logic here
            -- TODO check label logic here?
            goto continue
         end

         -- skip if line is empty
         if line == "" then
            goto continue
         end

         -- skip if line is seperator
         if seperator_start~= nil then
            if seperator_start > 0 then
               goto continue
            end
         end

         id = id + 1
         local r = require("nvim-rest-client.request"):init(id, label, line, headers)

         -- invalid request (eg. invalid method)
         if not r:validate() then
            goto continue
         end

         table.insert(requests, r)
         ::continue::
      end
   end

   return requests
end

return M
