$parentDirectory = Split-Path -Path $PSScriptRoot -Parent
$input = Join-Path -Path $parentDirectory -ChildPath "main.ahk"

Invoke-Expression "$PSScriptRoot/ahk2exe.exe /in $input /out $PSScriptRoot/Keyput-Methoard.exe /`icon $PSScriptRoot/icon.ico /base $PSScriptRoot/autohotkey64.exe"