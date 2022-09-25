if exists("g:loaded_nvimrestclient")
    finish
endif
let g:loaded_nvimrestclient = 1

" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/nvim-rest-client/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

" Expose functions to neovim
command! -nargs=1 NvimRestClientRequest lua require("nvim-rest-client").request(<args>)
