# Temp folders to clean
$tempFolders = @(
    "$env:LOCALAPPDATA\Temp",
    "C:\Windows\Temp"
)

foreach ($folder in $tempFolders) {
    if (Test-Path $folder) {
        Get-ChildItem -Path $folder -Force -ErrorAction SilentlyContinue | ForEach-Object {
            try {
                Remove-Item $_.FullName -Recurse -Force -ErrorAction Stop
            }
            catch {
                # Ignore files that are in use or cannot be deleted
            }
        }
    }
}