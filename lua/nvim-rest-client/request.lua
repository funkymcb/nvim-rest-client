local Request = {
   id = 0,
   label = "unlabeled",
   method = "",
   uri = "",
   -- http_version = "", TODO add this feature
   headers = {},
   -- short_string is a short description of the Request displayed in the telescope finder
   -- label: Request.method Request.uri
   short_string = ""
}
Request.__index = Request

local function split_request_string(str)
   local split = {}

   for w in str:gmatch("%S+") do
      table.insert(split, w)
   end

   return split
end

-- new gets a line from the .http file and parses it into the Request object
local function parse_request_string(str)
   local split = split_request_string(str)

   local method = split[1]
   local uri = split[2]

   return method, uri
end

function Request:validate()
   local valid_methods = {
      "OPTIONS",
      "GET",
      "HEAD",
      "POST",
      "PUT",
      "DELETE",
      "TRACE",
      "CONNECT",
   }

   for _, v in pairs(valid_methods) do
      if self.method == v then return true end
   end

   return false
end

function Request:init(id, label, request_str, headers)
   local request = {}
   local method, uri = parse_request_string(request_str)

   if label == "" then label = "unlabeled" end
   local short_string = string.format("ID %d: '%s' %s %s", id, label, method, uri)

   setmetatable(request, Request)
   request.id = id
   request.label = label
   request.method = method
   request.uri = uri
   request.headers = headers
   request.short_string = short_string

   return request
end

return Request
