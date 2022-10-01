local Request = {
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

function Request:init(label, request_str, headers)
   local request = {}
   local method, uri = parse_request_string(request_str)

   if label == "" then label = "unlabeled" end
   local short_string = string.format("%s: %s %s", label, method, uri)

   print(method, uri, short_string)
   setmetatable(request, Request)
   request.label = label
   request.method = method
   request.uri = uri
   request.headers = headers
   request.short_string = short_string

   return request
end

function Request:valid_methods()
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
   return valid_methods
end

return Request
