"
" autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>:silent call BiModeSet(1)<CR>
" in .vimrc to get the quickfix buffer/split to close on selection
"

function! PythonLocal(...)
    silent let l:n = 0
    silent set errorformat=\%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,
    silent let g:PYTHONRUN =   "python  " . "" . g:Strreplace(expand("%:r"),"./","")
    silent let g:PYTHONRUN =   "python  " . "" . expand("%")
endfunction

function! JavaLocal(...)
    silent let l:n = 0
    silent set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
    silent let g:JAVACOMPILE="javac -nowarn -cp . -d . " . shellescape(expand('%:p'))
    silent let g:JAVACOMPILE="export CLASSPATH=/tmp/classes; javac -nowarn -d /tmp/classes " . shellescape(expand('%:p'))
    silent let g:JAVACOMPILE="export CLASSPATH=/tmp/classes; javac -nowarn -d /tmp/classes " . shellescape(expand('%:p'))
    silent let g:JAVACOMPILE="javac -nowarn -d /tmp/classes " . shellescape(expand('%:p'))

    silent let g:JAVACOMPILE="javac -nowarn -d ./classes " . shellescape(expand('%:p'))
    silent let g:JAVACOMPILE="javac -nowarn -d ". $CLASSPATH . " " . shellescape(expand('%:p'))

    silent let g:JAVARUN =   "java  -d64  " . "" . g:Strreplace(expand("%:r"),"./","")
    silent let g:JAVARUN =   "export CLASSPATH=/tmp/classes;java  " . "" . g:Strreplace(expand("%:r"),"./","")
    silent let g:JAVARUN =   "java  " . "" . g:Strreplace(expand("%:r"),"./","")
    silent let g:JAVARUN =   "java  " . "" . g:Strreplace(expand("%:r"),"./","")
    silent let g:JAVARUN =   "export CLASSPATH=./classes;java  " . "" . g:Strreplace(expand("%:r"),"./","")
    silent let g:JAVARUN =   "export CLASSPATH=./classes;java  " . " -XX:+UnlockDiagnosticVMOptions -XX:+LogVMOutput -XX:LogFile=/tmp/jvm.log " . "" . g:Strreplace(expand("%:r"),"./","")
    silent let g:JAVARUN =   "export CLASSPATH=" . $CLASSPATH . ";java  -XX:+UnlockDiagnosticVMOptions -XX:+LogVMOutput -XX:LogFile=/tmp/jvm.log " . "" . g:Strreplace(expand("%:r"),"./","")
endfunction


function! ProgramCompile(...)
        if expand("%:e") == 'java'
               call JavaCompile()
        endif
endfunction


function! ProgramRun(...)
        if expand("%:e") == 'java'
               call JavaRun()
        endif
        if expand("%:e") == 'py'
               call PythonRun()
        endif
endfunction


function s:LogMessage(...)
    let l:ret = 0
    return l:ret
    let l:messages=[]
    call add(l:messages, a:1)
    call writefile(l:messages, "/tmp/vimscript.log", "a")
    return l:ret
endfunction

function! JavaCompile(...)
        silent execute "normal "
        silent call JavaLocal()
        update
        cclose
        silent echom expand("%:p") 
        call s:LogMessage(g:JAVACOMPILE)
        cexpr system(g:JAVACOMPILE)
        cw
        " Check if current window contains quickfix buffer (if cw opened  quickfix)
        if getbufvar(winbufnr(winnr()), '&buftype') == 'quickfix'
           silent call BiModeSet(0)
           resize 10
        endif
endfunction


function! PythonRun(...)
        silent execute "normal "
        silent call PythonLocal()
        update
        cclose
		let idx = 1
		let arg = ""
		while idx <= a:0
			execute "let a = a:" . idx
			let arg = arg . ' ' . a
			let idx = idx + 1
		endwhile
		silent execute "!clear"
		silent execute "!python --version 2>&1 >/dev/null"
		silent execute "!print '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'"
                execute "!" . g:PYTHONRUN . " " . arg . " | tee out"
endfunction


function! JavaRun(...)
        silent execute "normal "
        call s:LogMessage("Java Run")
        silent call JavaLocal()
        update
        cclose
        silent echom expand("%:p") 
        cexpr system(g:JAVACOMPILE)
        cw
 	silent let e = v:shell_error
        " Check if current window contains quickfix buffer (if cw opened  quickfix)
        if getbufvar(winbufnr(winnr()), '&buftype') == 'quickfix'
           resize 10
 	   let e = 100
        endif
        if e == 0
		let idx = 1
		let arg = ""
		while idx <= a:0
			execute "let a = a:" . idx
			let arg = arg . ' ' . a
			let idx = idx + 1
		endwhile
		silent execute "!clear"
		" silent execute "!java -version 2>&1 >/dev/null | grep Environment"
		silent execute "!javac -version"
		silent execute "!java -version"
		
		silent execute "!print '+'"
		silent execute "!print '+'"
		silent execute "!print '+'"
		silent execute "!print '+'"
                silent execute "!echo $CLASSPATH"
		silent execute "!print '+'"
                silent execute "!ls ~/classes | gawk '{printf("%-26s ",$1);if ((NR%4)==0) printf("\n"); }END {if ((NR%4)!=0) printf("\n");}'"
		"silent execute "!print '+'"
                "silent execute "!ls *.java    | gawk -f /usr/local/tools/fourcol.awk"
                let sz="Source Code"
		silent execute "!print '" . sz . "  " . repeat('+', 78 - len(sz) ) "' | tee out" 
                silent execute "!cat " . expand("%:p") .  " | gawk '/^$/ {next} /^[ ]*[/][/]/ {next} {print $0}'  | tee -a out" 

"               let sz=""
" 		silent execute "!print '" . sz . repeat('+', 80 - len(sz) ) "' | tee -a out" 
" 		silent execute "!java -version 2>&1 >/dev/null | grep Environment | tee -a out"
                let sz="Program output is below"
		silent execute "!print '" . sz . "  " . repeat('+', 78 - len(sz) ) "' | tee -a out" 

                execute "!" . g:JAVARUN . " " . arg  . " | tee -a out"
        endif
endfunction
