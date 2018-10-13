Clear-Host
#Getting worklocation and change replace path seperates to help if running on Linux
$workingDirTemp = $PSCommandPath | Split-Path -Parent
$workingDir = $workingDirTemp -replace ("\\", "/") #for linux

$apiKey = Get-Content $($workingDir + "/configs/" + "config.csv")
$ipListToCheck = Import-Csv $($workingDir + "/source/" + "ipstocheck.csv")

foreach ($ip in $ipListToCheck) {
    try {[ipaddress]$ip.IPTOCHECK | Out-Null} 
    catch {
        Write-Host "----" $($ip.IPTOCHECK) "is not valid" -ForegroundColor Red
        Continue
    } # Valiate if its a good ip, if not, just ignore the value
    Write-Host "Checking if IP is on the list..."$($ip.IPTOCHECK)
    try {
        
        [PSCustomObject[]]$fullResponse = Invoke-RestMethod "https://www.abuseipdb.com/check/$($ip.IPTOCHECK)/json?key=$apiKey&days=$($ip.DAY)"
                if ($fullresponse.count -ge 1){
                    Write-Host $($ip.IPTOCHECK) "- Is on the list in the last"$($ip.DAYS)"day(s)). IP Location: $($fullResponse.Country[0]). # of Reports:"$fullResponse.count -ForegroundColor Red
                }
                else
                {
                    Write-Host $($ip.IPTOCHECK) "- Is not on the list in the last"$($ip.DAYS)"day(s)" -ForegroundColor Green
                }
    }
    catch {
        $_.Exception.Response 
        Write-Host "---" $($ip.IPTOBLOCK)"- Failed To Connect TO ABUSEIP or Errored" -ForegroundColor Red            
    }
    Write-Host ""
}
