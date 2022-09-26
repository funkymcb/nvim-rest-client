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

function M.init(cfg)
   local depth = cfg.search_depth
   local http_files = search_http_files(depth)
   local requests = require("nvim-rest-client.fileparser.parse").parse_http_files(http_files)

   return requests
end

return M

