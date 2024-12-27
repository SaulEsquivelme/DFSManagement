$Newsvm = "new-svm.companydomain.com"
$shares = Import-Csv -Path "C:\Users\User1\Documents\DFSresults.csv"
$newFolders = @()
foreach ($share in $shares){
    $dfstarget = $share.TargetPath
    $folders = $dfstarget.Split("\")[3..5]
    $newFolder = "\\" + $Newsvm + "\" + ($folders -join "\")
    $share.Path 
    $dfstarget
    $newFolder
    "-------------------------"
    if ($share.State -eq "Online"){
        #New-DfsnFolderTarget -Path $share.Path -TargetPath $newFolder -State Online
        #Set-DfsnFolderTarget -Path $share.Path -TargetPath $share.TargetPath -State Offline
    }
    else{
        #New-DfsnFolderTarget -Path $share.Path -TargetPath $newFolder -State Offline
    }
    $newFolders += $newFolder 
}
$newFolders | Export-Csv -Path "C:\Users\User1\Documents\newFoldersFSx.csv" 

