cls
$targetdrives = Get-Content -path C:\Scripts\drivelist.txt
Write-Host "This Script will output a list of folders and files to a CSV file that you specify in drivelist.txt."
Write-Host "This script will not display System or Hidden Files.`n"

#Not using the following lines at the moment: (Use if you want a specific folder path)
# Reads Folder path input from User.
#$TargetDirectory = Read-Host 'Please enter direct Network Folder Path name'

cls
Write-Host "`nRunning, please wait... `n" -foregroundcolor "Red"

Foreach($targetdrive in $targetdrives)
{
Write-Host 'Working on' $targetdrive 
$driveout = $targetdrive.Split('\')[-1]

Get-ChildItem -Path $targetdrive -Recurse -ErrorAction SilentlyContinue | sort-object -property creationtime |
Select-Object creationtime, name, directoryname, length |
# Selects Properties of Files to List.
Export-Csv -Path "N:\Scripts\!File_Lists_from_Servers\Drives\${driveout} Files.csv" -Encoding ascii -NoTypeInformation
}

Write-Host "Complete" -foregroundcolor "Red"
