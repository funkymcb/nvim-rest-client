-- fileparser searches for *.http files in $PWD and parses the requests into request objects
local M = {}

local default_config = {
   enable = true,
   search_depth = 1
}

local config = {}

M.setup = function(cfg)
   config = vim.tbl_extend('force', default_config, cfg or {})

   if not config.enable then
      return
   end

   require('nvim-rest-client.fileparser.search').init(config)
end

return M
