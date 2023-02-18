if exists("g:loaded_nvimrestclient")
    finish
endif
let g:loaded_nvimrestclient = 1

" " Defines a package path for Lua. This facilitates importing the
" " Lua modules from the plugin's dependency directory.
" let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/nvim-rest-client/deps"
" exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

function! s:Run_request(host) abort
    return jobstart(['/Users/petery/Coding/github.com/funkymcb/nvim-rest-client/bin/hello'], {'rpc': v:true})
endfunction

call remote#host#Register('hello', 'x', function('s:Run_request'))
call remote#host#RegisterPlugin('hello', '0', [
\ {'type': 'function', 'name': 'Hello', 'sync': 1, 'opts': {}},
\ ])

" Expose functions to neovim
command! -nargs=0 NvimRestClientFindRequests lua require("nvim-rest-client").find_requests()
command! -nargs=0 NvimRestClientMakeRequest lua require("nvim-rest-client").request()
