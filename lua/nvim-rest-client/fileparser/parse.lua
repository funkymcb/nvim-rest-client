local M = {}

-- parse_http_files parses http files and returns table of requests
-- TODO write TESTS and more TESTS for this logic!
function M.parse_http_files(files)
   local requests = {}

   for _, file in pairs(files) do
      for line in io.lines(file) do
         local hashtag_start, hashtag_end = string.find(line, "###")
         local at_start, _ = string.find(line, "@")

         -- variable declaration
         if at_start == 1 or at_start == 3 then
            -- TODO add variable logic here
            goto continue
         end

         -- skip if line is empty
         if line == "" then
            goto continue
         end

         -- skip if line is seperator
         if hashtag_start ~= nil then
            if hashtag_start > 0 and hashtag_end <= 3 then
               goto continue
            end
         end

         requests[#requests + 1] = line
         ::continue::
      end
   end

   return requests
end

return M
