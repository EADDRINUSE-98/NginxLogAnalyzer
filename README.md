# NginxLogAnalyzer
This repository is for a bash script that I created as a solution for the "Nginx Log Analyzer" this [project](https://roadmap.sh/projects/nginx-log-analyser).
# How to Run
1. Clone the repository:
```sh
$ git clone https://github.com/EADDRINUSE-98/NginxLogAnalyzer.git
```
2. Go into the cloned repository:
```sh
$ cd NginxLogAnalyzer
```
3. Give the script executable permissions:
```sh
$ chmod 770 nginx_log_analyzer.sh
```
4. Execute the script:
```sh
$ ./nginx_log_analyzer.sh nginx.log
```
# Output
```sh
Top 5 IP addresses with the most requests:
178.128.94.113 - 1087 requests
142.93.136.176 - 1087 requests
138.68.248.85 - 1087 requests
159.89.185.30 - 1086 requests
86.134.118.70 - 277 requests

Top 5 most requested paths:
/v1-health - 4560 requests
/ - 270 requests
/v1-me - 232 requests
/v1-list-workspaces - 127 requests
/v1-list-timezone-teams - 75 requests

Top 5 response status codes:
200 - 5740 requests
404 - 937 requests
304 - 621 requests
400 - 260 requests
403 - 23 requests

Top 5 user agents:
DigitalOcean Uptime Probe 0.22.0 (https://digitalocean.com) - 4347 requests
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 - 513 requests
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 - 332 requests
Custom-AsyncHttpClient - 294 requests
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 - 282 requests
```
# Considerations
Please keep in mind that is script is not the most optimal solution. So, make sure to temper with this script and make your own solution from it.