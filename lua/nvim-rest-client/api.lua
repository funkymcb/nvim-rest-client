local M = {}

function M.request(request)
   -- TODO fix request validation
   -- if not request:validate() then
   --    print("invalid request:", vim.inspect(request))
   --    return
   -- end
   print(string.format("Hello %s", vim.inspect(request)))
end

return M
