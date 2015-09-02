" Syntax file for eC, an object-oriented superset of C
"
" Language: eC
" Maintainer: Roman Hargrave <roman@hargrave.info>
" Last Change: 2015-09-02 

if exists("b:current_syntax")
    finish
endif

" Include C syntax definitions, eC builds on top of them 
if version < 600 
    so <sfile>:p:h/c.vim
else 
    runtime! syntax/c.vim
    unlet b:current_syntax
endif 

" eC extensions 
syn keyword     ecStatement     new this delete import define incref decref
syn keyword     ecType          virtual property bool 
syn keyword     ecProperty      get set 
syn keyword     ecVisibility    static private public
syn keyword     ecStructure     class dbtable
syn keyword     ecBoolean       true false 

if version >= 508 || !exists("did_ec_syntax_inits")
    if version < 508
        let did_ec_syntax_inits = 1
        command -nargs=+ HiLink hi link <args>
    else 
        command -nargs=+ HiLink hi def link <args>
    endif 

    HiLink  ecStatement     Statement
    HiLink  ecType          Type
    HiLink  ecProperty      Statement 
    HiLink  ecVisibility    StorageClass
    HiLink  ecStructure     Structure 
    HiLink  ecBoolean       Boolean 

    delcommand HiLink
endif 

let b:current_syntax = "ec"
