@echo off

rem For correct string substitution, need delayed variable expansion
rem Beware: you'll scratch your head several times with this shit
setlocal enabledelayedexpansion

rem Set this variable to get some fancy debug output
set "vdeb="

rem List GitHub snapshots ('master' branch only)
set "fdir=dir *-master.zip /B /A:-D /ON /S"

rem Scan the list and for each file...
for /f %%a in ('!fdir!') do (
if not "!vdeb!"=="" echo a=%%a

    rem Get the file name and extension
    set "fold=%%~nxa"
if not "!vdeb!"=="" echo fold=!fold!

    rem List the snapshot's content
    "c:\Program Files\7-Zip\7z.exe" l "%%a" >liste.txt

    rem Get the date from the line with just the repository's name (root folder)
    for /f "tokens=1 delims= " %%b in ('findstr /e /c:"%%~na" liste.txt') do set "fdate=%%b"
if not "!vdeb!"=="" echo fdate1=!fdate!

    rem Parse the date from ISO format (2017-03-19)
    for /f "tokens=1,2,3,4 delims=-" %%b in ("!fdate!") do set "fdate=%%b%%c%%d%%e"
    set "fdate=!fdate: =0!"

    rem Compose the date in packed ISO format (170318)
    set "fdate=!fdate:~2!"
if not "!vdeb!"=="" echo fdate2=!fdate!

    rem Replace the '-master' branch name with the snapshot date
    call set "fnew=%%fold:-master=-master-!fdate!%%"
if not "!vdeb!"=="" echo fnew=!fnew!

    rem Rename the snapshot file (full path -> file name)
    ren "%%a" "!fnew!"
)

rem Delete the snapshot's content listing
del /f liste.txt
