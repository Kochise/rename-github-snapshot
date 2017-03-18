@echo off

rem For correct string substitution, need delayed variable expansion
rem Beware: you'll scratch your head several times with this shit
setlocal enabledelayedexpansion

rem Set this variable to get some fancy debug output
set "vdeb=t"

set "fdir=dir *-master.zip /B /A:-D /ON /S"

for /f %%a in ('!fdir!') do (
if not "!vdeb!"=="" echo a=%%a

    set "fold=%%~nxa"
if not "!vdeb!"=="" echo fold=!fold!

    "c:\Program Files\7-Zip\7z.exe" l "%%a" >liste.txt
    for /f "tokens=1 delims= " %%b in ('findstr /e /c:"%%~na" liste.txt') do set "fdate=%%b"
if not "!vdeb!"=="" echo fdate1=!fdate!

    for /f "tokens=1,2,3,4 delims=-" %%b in ("!fdate!") do set "fdate=%%b%%c%%d%%e"
    set "fdate=!fdate: =0!"
    set "fdate=!fdate:~2!"
if not "!vdeb!"=="" echo fdate2=!fdate!

    call set "fnew=%%fold:-master=-!fdate!%%"
if not "!vdeb!"=="" echo fnew=!fnew!

    ren "%%a" "!fnew!"
)

del /f liste.txt
