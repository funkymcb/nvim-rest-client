-- TODO research why this is not importing... has been installed with luarocks and lua version 5.4
local http = require("http")
local M = {}

function M.request(request)
   local response, err = http.request("GET", "http://localhost:8000/get")
   if err then error(err) end

   print(vim.api.nvim_echo(response.body))
end

return M
