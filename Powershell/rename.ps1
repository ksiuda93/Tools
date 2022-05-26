#rename.ps1
# .\rename.ps1 -Path C:\Users\KacperSiuda\Projects\

Param (
    $Path
)


Write-Output "[INFO] Starting script!"
Write-Output "[INFO] Looking the directories with following pattern: Name<Space>LastName..."


[string[]]$directoriesToRenameWithSpace = (Get-ChildItem -Path $Path -Filter "* *").Name

if ($directoriesToRenameWithSpace -gt $null){
    Write-Output "[INFO] Found the following directories: "
    Write-Output $directoriesToRenameWithSpace
    foreach ($dir in $directoriesToRenameWithSpace){
        $newName = $dir -replace '\s', ","
        Rename-Item $dir $newName –Confirm
    }
    Write-Output "[INFO] The directories have been adjusted to the Name,LastName format"
}

[string[]]$directoriesToRenameWithComma = (Get-ChildItem -Path $Path -Filter "*,*").Name

Write-Output "[INFO] Found the following directories: "
Write-Output $directoriesToRenameWithComma

if ($directoriesToRenameWithComma -gt $null){
    Write-Output "[INFO] Znaleziono następujace katalogi do poprawy: "
    Write-Output $directoriesToRenameWithComma
    foreach ($dir in $directoriesToRenameWithComma){
        $newName = $dir -replace ",", "_"
        Rename-Item $dir $newName –Confirm
    }
    Write-Output "[INFO] The directories have been adjusted to the Name_LastName format"
}