-- TODO research why this is not importing... has been installed with luarocks and lua version 5.4
-- local http = require("socket.http")
local M = {}

function M.request()
   -- local response, err = http.request("http://localhost:8000/get")
   -- if err then error(err) end

   -- print(vim.api.nvim_echo(response.body))
   print("lel")
end

return M
