

function! PythonLocal(...)
    silent let l:n = 0
    silent set errorformat=\%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,
    silent let g:PYTHONRUN =   "python  " . "" . g:strreplace(expand("%:r"),"./","")
    silent let g:PYTHONRUN =   "python  " . "" . expand("%")
    silent call BiModeSet(1)
endfunction

function! JavaLocal(...)
    silent let l:n = 0
    silent set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
    silent let g:JAVACOMPILE="javac -nowarn -cp . -d . " . shellescape(expand('%:p'))
    silent let g:JAVACOMPILE="javac -nowarn -cp ~/classes -d ~/classes " . shellescape(expand('%:p'))
    silent let g:JAVARUN =   "java  -d64  " . "" . g:strreplace(expand("%:r"),"./","")
    silent call BiModeSet(1)
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



function! JavaCompile(...)
        silent execute "normal "
        silent call JavaLocal()
        update
        cclose
        silent echom expand("%:p") 
        cexpr system(g:JAVACOMPILE)
        cw
        " Check if current window contains quickfix buffer (if cw opened  quickfix)
        if getbufvar(winbufnr(winnr()), '&buftype') == 'quickfix'
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
		silent execute "!java -version 2>&1 >/dev/null | grep Environment"
                silent execute "!print 'COMMAND=" . l:cmd . "'"
		silent execute "!print 'CLASSPATH='$CLASSPATH"
		silent execute "!print '+'"
                silent execute "!ls ~/classes | gawk '{printf("%-26s ",$1);if ((NR%4)==0) printf("\n"); }END {if ((NR%4)!=0) printf("\n");}'"
		silent execute "!print '+'"
                silent execute "!ls *.java    | gawk -f /usr/local/tools/fourcol.awk"
                let sz="SOURCE CODE"
		silent execute "!print '" . sz . repeat('+', 80 - len(sz) ) "' | tee out" 
                silent execute "!cat " . expand("%:p") . " | tee -a out" 
                let sz="RUN"
		silent execute "!print '" . sz . repeat('+', 80 - len(sz) ) "' | tee -a out" 
		silent execute "!java -version 2>&1 >/dev/null | grep Environment | tee -a out"
                execute "!" . g:JAVARUN . " " . arg  . " | tee -a out"
        endif
endfunction
