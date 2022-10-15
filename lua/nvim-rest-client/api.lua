local M = {}

function M.request(request)
   -- TODO parse short string to get the corresponding request
   -- This is just a poc, that requests of the plugin work
   -- TODO find a way to run 'echo NvimRestClientRequest()' in lua
   print(vim.api.nvim_echo({{'NvimRestClientRequest("Get", "http://localhost:8000/get")', 'None'}},
      false,
      {}
   ))
end

return M
