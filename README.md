# ps-abuseipreporter
This repo/script is for reporting IPs from a CSV input file to https://www.abuseipdb.com

## Setup
* git clone https://github.com/thenecroscope/ps-abuseipreporter.git  

These commands are option, just to prevent files being sent up to git
* git update-index --assume-unchanged configs/config.csv
* git update-index --assume-unchanged source/ips.csv (only if you want IPs to be reported to the API, see below)
* git update-index --assume-unchanged source/ipstocheck.csv (only if you want IPs to be checked, see below)

Enter your IPs in the ips.csv file and enter your API key from ABUSEIPDB into the config.csv.  
Note: The API will error if you try to report the same IP details again.

### ip.csv
* IPTOBLOCK - IP address to block. Does not take subnets or ranges.
* CATEGORIES - A comma seperated list of categories to report
* Comments - Optional notes to help the community

### View your requested IP's that have been logged
https://www.abuseipdb.com/user/XXXXX


## List of Categories
https://www.abuseipdb.com/categories


# ps-abuseipchecker
This script checks to see if the IP address is on the abduse list. It reports which country the IP is from and how many times the IP has been reported in the last x days.

## Usage
Enter your IPs in the ipstocheck.csv file and enter your API key from ABUSEIPDB into the config.csv.  


### ipstocheck.csv
* IPTOCHECK - The single IP address to check
* DAYS - Number of days back to check. Up to 30 days