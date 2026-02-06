Write-Host "===== SYSTEM INFORMATION ====="

Write-Host "Hostname: $env:COMPUTERNAME"
Write-Host "User: $env:USERNAME"
Write-Host "Date: $(Get-Date)"

Write-Host "`n--- CPU Info ---"
Get-CimInstance Win32_Processor | Select-Object Name

Write-Host "`n--- Memory Info ---"
Get-CimInstance Win32_OperatingSystem |
    Select-Object TotalVisibleMemorySize, FreePhysicalMemory

Write-Host "`n--- Disk Info ---"
Get-PSDrive -PSProvider FileSystem

Write-Host "`n--- Uptime ---"
(get-date) - (gcim Win32_OperatingSystem).LastBootUpTime
