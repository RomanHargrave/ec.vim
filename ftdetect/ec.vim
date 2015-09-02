augroup ec_lang_ftdetect
    au!
    au BufRead,BufNewFile *.ec      set ft=ec

    " eC project files are JSON data 
    au BufRead,BufNewFile *.epj     set ft=json
augroup END
