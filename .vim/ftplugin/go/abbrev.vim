function! ReturnIfErr()
    return
        \  "if err != nil {\r"
        \. "return nil, err\r"
        \. "}"
endfunction

iabbrev <expr> iferr ReturnIfErr()
