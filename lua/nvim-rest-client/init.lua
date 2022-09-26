local api = require("nvim-rest-client.api")
local M = {}

local default = {
}

function M.setup(opt)
   M.config = vim.tbl_deep_extend('force', default, opt or {})
   require("nvim-rest-client.fileparser").setup(M.config.fileparser)
end

M.request = api.request

return M
