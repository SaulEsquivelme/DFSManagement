$namespaces = @("\\companydomain.com\Folder1\*", "\\companydomain.com\Folder2\*")
$shares = Import-Csv -Path "C:\Users\User1\Documents\ONTAPshares.csv"
$results = @()
foreach ($share in $shares){
    $shareName = $share.shareName
    $shareName
    foreach ($namespace in $namespaces){
    $namespace
        foreach($dfsnFolder in (Get-DfsnFolder -path $namespace)){
            #$dfsnfolder
            $dfsTargets = Get-DfsnFolderTarget $dfsnFolder.Path | Select-Object Path,TargetPath,State
            foreach($dfstarget in $dfsTargets){
            if ($dfstarget -like "*$shareName*"){
                $dfstarget
                $results += $dfstarget
                }
            }
        }
    }

}
$results | Export-Csv -Path "C:\Users\User1\Documents\DFSresults.csv"
