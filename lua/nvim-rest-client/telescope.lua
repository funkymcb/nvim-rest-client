local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local sorters = require("telescope.sorters")

local M = {}

local default_config = {
   search_depth = 1
}

local config = {}

function M.init(cfg)
   config = vim.tbl_extend('force', default_config, cfg or {})
end

function M.show_requests()
   local requests = require('nvim-rest-client.fileparser.search').init(config)

   if requests == nil then
      return
   end

   local request_short_strings = {}
   for _, r in pairs(requests) do
      table.insert(request_short_strings, r.short_string)
   end

   local opts = {
      finder = finders.new_table(request_short_strings),
      sorter = sorters.get_fzy_sorter({})
   }

   local picker = pickers.new(opts, {})

   picker:find()
end

return M
