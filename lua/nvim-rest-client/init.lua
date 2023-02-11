local http = require("nvim-rest-client.http")
local telescope = require("nvim-rest-client.telescope")
local M = {}

local default = {}

function M.setup(opt)
   M.config = vim.tbl_deep_extend('force', default, opt or {})
   require("nvim-rest-client.telescope").init(M.config.fileparser)
end

M.find_requests = telescope.show_requests
M.request = http.request

return M
