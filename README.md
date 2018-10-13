# ps-abuseipreporter
This repo/script is for reporting IPs from a CSV input file to https://www.abuseipdb.com

## Setup
* git clone https://github.com/thenecroscope/ps-abuseipreporter.git  
* git update-index --assume-unchanged configs/config.csv
  
Enter your IPs in the ips.csv file and enter your API key from ABUSEIPDB into the config.csv.  
Note: The API will error if you try to report the same IP details again.

### config.csv
* IPTOBLOCK - IP address to block. Does not take subnets or ranges.
* CATEGORIES - A comma seperated list of categories to report
* Comments - Optional notes to help the community

### View your requested IP's that have been logged
https://www.abuseipdb.com/user/XXXXX


## List of Categories
https://www.abuseipdb.com/categories