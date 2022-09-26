-- fileparser searches for *.http files in $PWD and parses the requests into request objects
local M = {}

local default_config = {
   enable = true,
   search_depth = 1
}

local config = {}

M.setup = function(cfg)
   config = vim.tbl_extend('force', default_config, cfg or {})
   if config.enable then
      print(string.format('fileparser is active! search_depth = %d', config.search_depth))
   end
end

return M
