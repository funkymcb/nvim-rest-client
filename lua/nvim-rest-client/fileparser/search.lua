local M = {}

-- search_http_files returns table of stings of all ".http" files
local function search_http_files(search_depth)
   local i, http_files = 0, {}
   local pwd_files = io.popen('find . -maxdepth '..search_depth):lines()

   for file in pwd_files do
      local is_http_file = string.find(file, ".http")
      if (is_http_file ~= nil) then
         i = i + 1
         http_files[i] = file
      end
   end

   return http_files
end

-- parse_http_files parses http files and returns table of requests
-- TODO write TESTS and more TESTS for this logic!
local function parse_http_files(files)
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

M.init = function(cfg)
   local depth = cfg.search_depth
   local http_files = search_http_files(depth)
   local requests = parse_http_files(http_files)

   -- TODO add telescope logic to another module and add function
   -- local opts = {
   --    finder = finders.new_table(requests),
   --    sorter = sorters.get_fzy_sorter({})
   -- }

   -- local picker = pickers.new(opts, {})

   -- picker:find()
end

return M

