Clear-Host
#Getting worklocation and change replace path seperates to help if running on Linux
$workingDirTemp = $PSCommandPath | Split-Path -Parent
$workingDir = $workingDirTemp -replace ("\\", "/") #for linux

$apiKey = Get-Content $($workingDir + "/configs/" + "config.csv")
$ipListToBan = Import-Csv $($workingDir + "/source/" + "ips.csv")

foreach ($ip in $ipListToBan) {
    try {[ipaddress]$ip.IPTOBLOCK | Out-Null} 
    catch {
        Write-Host "----" $($ip.IPTOBLOCK) "is not valid" -ForegroundColor Red
        Continue
    } # Valiate if its a good ip, if not, just ignore the value
    Write-Host "Requesting IP To Be Blocked..."$($ip.IPTOBLOCK)
    try {
        $fullResponse = Invoke-WebRequest "https://www.abuseipdb.com/report/json?key=$apiKey&category=$($ip.CATEGORIES)&comment=$($ip.COMMENT)&ip=$($ip.IPTOBLOCK)"     
        if ($fullResponse.statuscode -eq 200 ) {
            Write-Host "-" $($ip.IPTOBLOCK)"- Added Successfully" -ForegroundColor Green
        }
        else {
            Write-Host "---" $($ip.IPTOBLOCK)"- Failed To Add" -ForegroundColor Green            
        }
    }
    catch {
        Write-Host "An Error Has Occured for IP: $($ip.IPTOBLOCK)" -ForegroundColor Red
    }
    Write-Host ""
}
