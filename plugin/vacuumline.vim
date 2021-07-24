if exists('g:loaded_vacuumline') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

if !has('nvim')
    echohl Error
    echom "Sorry this plugin only works with versions of neovim that support lua"
    echohl clear
    finish
endif

let g:loaded_vacuumline = 1

lua require('vacuumline').vacuumline_augroup()

let &cpo = s:save_cpo
unlet s:save_cpo
