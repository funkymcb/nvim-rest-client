# Nvim-Rest-Client
Rest Client Plugin for Neovim. Inspired by [Rest Client Plugin for VS Code](https://github.com/Huachao/vscode-restclient)  
The plugin aims to be fully compatible with the .http files of the above mentioned VS Code Plugin and its features  
Nvim-Rest-Client utilizes telescope as its "UI"

## Requirements
- [Neovim](https://github.com/neovim/neovim) >= 0.7.0
- [nvim-telescope](https://github.com/nvim-telescope/telescope.nvim)

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
TBD

## Roadmap
- [x] implement file parser for .http files
    - [x] search for files depending on search_depth
    - [x] split file by `###` and store them into requests
    - [ ] write tests for http file parsing
    - [ ] define request objects
- [x] implement telescope integration for requests
- [ ] implement request logic
- [ ] implement language server or else for syntax highlighting and error output
