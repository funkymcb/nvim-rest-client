# WIP: Nvim-Rest-Client
Rest Client Plugin for Neovim. Inspired by [Rest Client Plugin for VS Code](https://github.com/Huachao/vscode-restclient)  
The plugin aims to be fully compatible with the .http files of the above mentioned VS Code Plugin and its features  
Nvim-Rest-Client utilizes telescope as its "UI"

## Requirements
- [Neovim](https://github.com/neovim/neovim) >= 0.7.0
- [nvim-telescope](https://github.com/nvim-telescope/telescope.nvim)
- [luasocket](https://github.com/lunarmodules/luasocket)
    to install luasocket run `luarocks install luasocket`

## Installation
Should work with any plugin manager for Neovim. For example using [packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
return require('packer').startup(function(use)
   use {
      'funkymcb/nvim-rest-client',
      requires = {
         'nvim-telescope/telescope.nvim',
      }
   }
end)
```

## Setup
Full Setup with default values. Change them in your neovim config as needed:
```lua
require('nvim-rest-client').setup({
   fileparser = {       -- fileparser searches for .http files and parses them into request objects
      search_depth = 1,     -- how deep are the .http files nested in the $PWD
   }
})
```


## Usage
The nvim-rest-client adds one command to vim:

- `:NvimRestClientFindRequests`

This command initializes the search and parsing of .http files in the $PWD  
If .http files are found it will open a telescope prompt with all requests.  
By pressing <CR> the request will be executed.

You could map this command to anything you like. I use it like the following  
`nnoremap("<leader>fr", ":NvimRestClientFindRequests<CR>")`

## Local Developmet
for local development you can clone my testing api which provides various basic endpoints for testing.

- [testing-api](git clone git@github.com:funkymcb/rest-client-test-api.git)

just run `go run main.go`
The api listens on port 8000. Your .http testing files should look like this:
```
GET http://localhost:8000/get
```

## Roadmap
- [x] implement file parser for .http files
    - [x] search for files depending on search_depth
    - [x] split file by `###` and store them into requests
    - [ ] write tests for http file parsing
    - [x] define request objects
- [x] implement telescope integration for requests
- [ ] implement request logic
- [ ] implement language server or else for syntax highlighting and error output
