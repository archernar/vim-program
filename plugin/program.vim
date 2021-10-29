"
" autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>:silent call BiModeSet(1)<CR>
" in .vimrc to get the quickfix buffer/split to close on selection
"
function! JavaFileListShort(...)
    let l:MAXBUFFERS=255
    let l:c=1
    let l:body=[]
    while l:c <= l:MAXBUFFERS 
        if (bufexists(l:c))
                if (getbufvar(l:c, '&buftype') == "")
                    if !(bufname(l:c) == "")
                       if (stridx(bufname(l:c), ".java") > -1)
                           call add(l:body, bufname(l:c))
                       endif
                    endif
                endif
        endif
        let l:c += 1
    endwhile 

    let l:sz = ""
    let l:delim = ""
    for l:l in l:body
        let l:sz = l:sz . l:delim . l:l
        let l:delim = " "
    endfor
    return l:sz
endfunction

function! JavaFileList(...)
    let l:MAXBUFFERS=255
    let l:c=1
    let l:body=[]
    while l:c <= l:MAXBUFFERS 
        if (bufexists(l:c))
                if (getbufvar(l:c, '&buftype') == "")
                    if !(bufname(l:c) == "")
                       if (stridx(bufname(l:c), ".java") > -1)
                           call add(l:body, fnamemodify(bufname(l:c), ':p'))
                       endif
                    endif
                endif
        endif
        let l:c += 1
    endwhile 

    let l:sz = ""
    let l:delim = ""
    for l:l in l:body
        let l:sz = l:sz . l:delim . l:l
        let l:delim = " "
    endfor
    return l:sz
endfunction

function! PythonLocal(...)
    silent let l:n = 0
    silent set errorformat=\%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,
    silent let g:PYTHONRUN =   "python  " . "" . g:Strreplace(expand("%:r"),"./","")
    silent let g:PYTHONRUN =   "python  " . "" . expand("%")
endfunction

function! JavaLocal(...)
    silent let l:n = 0
    silent set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
    " Alternatives
    " silent let g:JAVACOMPILE="javac -nowarn -cp . -d . " . shellescape(expand('%:p'))
    " silent let g:JAVACOMPILE="export CLASSPATH=/tmp/classes; javac -nowarn -d /tmp/classes " . shellescape(expand('%:p'))
    " silent let g:JAVACOMPILE="export CLASSPATH=/tmp/classes; javac -nowarn -d /tmp/classes " . shellescape(expand('%:p'))
    " silent let g:JAVACOMPILE="javac -nowarn -d /tmp/classes " . shellescape(expand('%:p'))
    " silent let g:JAVACOMPILE="javac -nowarn -d ./classes " . shellescape(expand('%:p'))
    " silent let g:JAVACOMPILE="javac -nowarn -d ". $CLASSPATH . " " . shellescape(expand('%:p'))
    " silent let g:JAVARUN =   "java  -d64  " . "" . g:Strreplace(expand("%:r"),"./","")
    " silent let g:JAVARUN =   "export CLASSPATH=/tmp/classes;java  " . "" . g:Strreplace(expand("%:r"),"./","")
    " silent let g:JAVARUN =   "java  " . "" . g:Strreplace(expand("%:r"),"./","")
    " silent let g:JAVARUN =   "java  " . "" . g:Strreplace(expand("%:r"),"./","")
    " silent let g:JAVARUN =   "export CLASSPATH=./classes;java  " . "" . g:Strreplace(expand("%:r"),"./","")
    " silent let g:JAVARUN =   "export CLASSPATH=./classes;java  " . " -XX:+UnlockDiagnosticVMOptions -XX:+LogVMOutput -XX:LogFile=/tmp/jvm.log " . "" . g:Strreplace(expand("%:r"),"./","")
    " silent let g:JAVARUN =   "export CLASSPATH=" . $CLASSPATH . ";java  -XX:+UnlockDiagnosticVMOptions -XX:+LogVMOutput -XX:LogFile=/tmp/jvm.log " . "" . g:Strreplace(expand("%:r"),"./","")
    " silent let g:JVMCMD =   "java  -Xms1024m -Xmx2048m -Xss100m  -XX:+UnlockDiagnosticVMOptions -XX:+LogVMOutput -XX:LogFile=/tmp/jvm.log " . "" . g:Strreplace(expand("%:t"),".java","")
    " silent let g:JAVARUN =   "export CLASSPATH=" . $CLASSPATH . ";java  -Xms2048m -Xmx2048m -Xss1024m  -XX:+UnlockDiagnosticVMOptions -XX:+LogVMOutput -XX:LogFile=/tmp/jvm.log " . "" . g:Strreplace(expand("%:t"),".java","")
    
    silent let g:JAVACOMPILE="export CLASSPATH=" . $CLASSPATH . ";javac -nowarn -d ./classes " . shellescape(expand('%:p'))
    silent let g:JAVACOMPILEALL="export CLASSPATH=" . $CLASSPATH . ";javac -nowarn -d ./classes " . JavaFileList()
    silent let g:OPTARGS_SAMPLE="export JVM_OPTARGS=\"-Xms1024m -Xmx2048m -Xss100m  -XX:+UnlockDiagnosticVMOptions -XX:+LogVMOutput -XX:LogFile=/tmp/jvm.log\""
    silent let g:OPTARGS="-Xms1024m -Xmx2048m -Xss100m  -XX:+UnlockDiagnosticVMOptions -XX:+LogVMOutput -XX:LogFile=/tmp/jvm.log"
    silent let g:OPTARGS="-verbose:class -XX:+UnlockDiagnosticVMOptions -XX:+LogVMOutput -XX:LogFile=./jvm.log"
    silent let g:OPTARGS=""
    silent let g:JVMCMD =   "java" . " " . g:OPTARGS . " " . g:Strreplace(expand("%:t"),".java","") . "  2> ./jvm.err"

    silent let g:JAVARUN =   "export CLASSPATH=" . $CLASSPATH . ";" . g:JVMCMD

    call s:LogMessage(" ")
    call s:LogMessage("JAVA RUN")
    call s:LogMessage(g:JAVARUN)
    call s:LogMessage(" ")
    call s:LogMessage("JAVA COMPILE")
    call s:LogMessage(g:JAVACOMPILE)
    call s:LogMessage(" ")
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


function! s:LogMessage(...)
    let l:ret = 0
    if 1 == 0
        let l:messages=[]
        call add(l:messages, a:1)
        call writefile(l:messages, "/tmp/vimscript.log", "a")
    endif
    return l:ret
endfunction

function! s:dq(...)
    return "\"" a:1 "\""
endfunction

function! JavaCompile(...)
        silent execute "normal "
        silent call JavaLocal()
        update
        cclose
        silent echom expand("%:p") 
        silent echom g:JAVACOMPILE
        cexpr system(g:JAVACOMPILE)
        cw
        " Check if current window contains quickfix buffer (if cw opened  quickfix)
        if getbufvar(winbufnr(winnr()), '&buftype') == 'quickfix'
           silent call BiModeSet(0)
           resize 10
        endif
endfunction

function! JavaCompileAll(...)
        silent execute "normal "
        silent call JavaLocal()
        update
        cclose
        echom JavaFileListShort()
        cexpr system(g:JAVACOMPILEALL)
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
	    silent execute "!echo -n 'Java Version : '"
		silent execute "!javac -version"
		silent execute "!echo 'Class Path is: " . $CLASSPATH    . "' | tee -a jout"
		silent execute "!echo 'Compiled with: " . g:JAVACOMPILE . "' | tee -a jout"
		silent execute "!echo 'Executed with: " . g:JVMCMD      . "' | tee -a jout"
  		silent execute "!print '" . repeat('-', 100 - 0 )         "' | tee -a out" 
        "silent execute "!ls ~/classes | gawk '{printf("%-26s ",$1);if ((NR%4)==0) printf("\n"); }END {if ((NR%4)!=0) printf("\n");}'"
        silent execute "!cat -n " . expand("%:p") .  " | gawk '/^$/ {next} /^[ ]*[/][/]/ {next} {print $0}'  | tee -a out" 
  	    silent execute "!print '" . repeat('-', 100 - 0 )         "' | tee -a out" 
        execute "!" . g:JAVARUN . " " . arg  . " | tee -a out"
        endif
endfunction
function! JavaRun2(...)
                let l:body=[]
                call add(l:body, "echo ====================================================="  )
                call add(l:body, "echo Running Java Program"  )
                call add(l:body, "echo ====================================================="  )
                call add(l:body, "echo "  )
                call add(l:body, g:JAVARUN)
                call add(l:body, "echo "  )
                call add(l:body, "echo "  )
                call writefile(l:body, "/tmp/sh.sh")
                " ######################################
                " geometry WIDTHxHEIGHT+XOFF+YOFF
                " TOP SCREEN UPPER LEFT   4x4+100+0
                " BOT SCREEN UPPER LEFT   4x4+100+1125
                " The right side is about 1500 or so
                " ######################################
                execute "!gnome-terminal --geometry=100x11+1100+1125 -- bash -c \"chmod 777 /tmp/sh.sh;/tmp/sh.sh;read \" &"
                "execute "!gnome-terminal --geometry=100x11+1100+1125 -- bash -c \"chmod 777 /tmp/sh.sh;/tmp/sh.sh;exec bash \" &"

                "execute "!gnome-terminal -fa 'Monospace' -fs 10 -geometry 93x31+100+1350 -e \"" "chmod 777 /tmp/sh.sh;/tmp/sh.sh" ";bash\""
                "execute "!xterm -geometry 93x31+100+1350 -e \"" g:JAVARUN ";bash\""
                "execute "!" . g:JAVARUN . " " . arg  . " | tee -a out"
endfunction
