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

" C compiler extensions 

syn keyword     ccBuiltin       __attribute__ __stdcall _stdcall __stdcall__
syn keyword     ccBuiltin       asm __asm _asm __asm__ 

" eC extensions 

syn keyword     ecStatement     delete new new0 renew renew0 define     

syn keyword     ecStatement     import remote incref isset
syn keyword     ecStatement     subclass namespace using 
syn keyword     ecStatement     watch stopwatching firewatchers watchtable 

syn keyword     ecHint          class_fixed class_no_expansion class_default_property
syn keyword     ecHint          class_data class_property property_category
syn keyword     ecType          class_designer

syn keyword     ecStatement     virtual property remote 

syn keyword     ecType          String Class
syn keyword     ecType          Array List Map Iterator 

syn keyword     ecVisibility    static private public 
syn keyword     ecVisibility    dllexport dllimport stdcall

syn keyword     ecStructure     class 

" eC EDA features
syn keyword     ecEDAType       dbtable dbindex dbfield
syn keyword     ecEDAStatemment database_open 

" Language constants 
syn keyword     ecConstant      false null value this thisclass 

" VIM has a distinct category for boolean constants
syn keyword     ecBoolean       true false 

" Properties subsystem 
syn keyword     ecProperty      get set  

" eC "primitive" data types 
syn keyword     ecType          bool byte 
syn keyword     ecType          uint uint16 uint32 uint64 uintptr uintsize
syn keyword     ecType          int64 intprt intsize 
syn keyword     ecType          unichar

" eC data type bounds
syn keyword     ecConstant      MAXBYTE MAXWORD MININT MAXINT MININT64 MAXINT64 MAXDWORD MAXQWORD
syn keyword     ecConstant      MINFLOAT MAXFLOAT MINDOUBLE MAXDOUBLE

" eC data type format specifiers
syn keyword     ecConstant      FORMAT64HEXLL FORMAT64HEX FORMAT64DLL FORMAT64D FORMAT64U

" eC _WORD macros
syn keyword     ecConstant      PUTXWORD GETXWORD PUTXDWORD GETXDWORD GETXQWORD PUTXQWORD 

if version >= 508 || !exists("did_ec_syntax_inits")
    if version < 508
        let did_ec_syntax_inits = 1
        command -nargs=+ HiLink hi link <args>
    else 
        command -nargs=+ HiLink hi def link <args>
    endif 

    HiLink  ccBuiltin       Statment 

    HiLink  ecStatement     Statement
    HiLink  ecHint          Statement 
    HiLink  ecType          Type
    HiLink  ecProperty      Statement
    HiLink  ecVisibility    StorageClass
    HiLink  ecStructure     Structure 
    HiLink  ecBoolean       Boolean 
    HiLink  ecConstant      Constant

    HiLink  ecEDAType       Type
    HiLink  ecEDAStatemment Statement

    delcommand HiLink
endif 

let b:current_syntax = "ec"
