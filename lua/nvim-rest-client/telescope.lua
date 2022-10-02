local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local sorters = require("telescope.sorters")
-- local previewers = require("telescope.previewers")

local M = {}

local default_config = {
   search_depth = 1
}

local config = {}

function M.init(cfg)
   config = vim.tbl_extend('force', default_config, cfg or {})
end

local function make_request(prompt_bufnr)
   local selected = action_state.get_selected_entry()
   require('nvim-rest-client').request(selected)
   actions.close(prompt_bufnr)
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
      layout_strategy = "vertical",
      layout_config = {
         height = 20,
         width = 0.5,
         prompt_position = "top"
      },
      sorting_strategy = "ascending",

      finder = finders.new_table(request_short_strings),
      sorter = sorters.get_fzy_sorter(),

      attach_mappings = function(prompt_bufnr, map)
         map("i", "<CR>", make_request)

         map("n", "<CR>", make_request)
         return true
      end,
   }

   local picker = pickers.new(opts, {})
   picker:find()

   -- TODO implement previewer
   -- local previewer = previewers.new_termopen_previewer()
   -- previewer:new()
end

return M
