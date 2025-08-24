#!/bin/bash

showhelp() {
  echo -e "nginx_log_analyzer.sh: A basic nginx log analyzer.\n"
  echo -e "nginx_log_analyzer.sh: nginx_log_analyzer.sh [-h|--help] NGINX_LOG_PATH\n"
  echo -e "Options:\n"
  echo -e "\t-h|--help\tShow this help page.\n"
  echo -e "Postional arguments:\n"
  echo -e "\tNGINX_LOG_PATH\tPath to the nginx log file.\n"
}

if [[ $1 == "-h" || $1 == "--help" ]]; then
  showhelp
  exit 1
elif [[ $# > "1" ]]; then
  echo -e "[X]Error: Too many arguments.\n"
  showhelp
  exit 1
elif [[ ! -e "$1" ]]; then
  echo -e "[X]Error: No such \"$1\" exist or is not a regular file.\n"
  showhelp
  exit 1
fi

#color codes
RED="\e[31m"
COLR_RST="\e[0m"


NGINX_LOG_PATH=$1

Top5Ip() {
  echo -e "${RED}Top 5 IP addresses with the most requests:${COLR_RST}"
  cut -d " " -f 1 $NGINX_LOG_PATH | sort -n | uniq -c | sort -rn | head -n 5 | awk -F " " '{
    print $2, "-", $1, "requests"
  }'
  echo ""
}

Top5Path() {
  echo -e "${RED}Top 5 most requested paths:${COLR_RST}"
  cut -d "\"" -f 2 $NGINX_LOG_PATH | cut -f 2 -d " " | sort | uniq -c | sort -rn | head -n 5 | awk -F " " '{
    print $2, "-", $1, "requests"
  }'
  echo ""
}

Top5ResCode() {
  echo -e "${RED}Top 5 response status codes:${COLR_RST}"
  cut -d "\"" -f 3 $NGINX_LOG_PATH | cut -d " " -f 2 | sort -n | uniq -c | sort -rn | head -n 5 | awk -F " " '{
    print $2, "-", $1, "requests"
  }'
  echo ""
}

Top5UserAgent() {
  echo -e "${RED}Top 5 user agents:${COLR_RST}"
  cut -d "\"" -f 6 $NGINX_LOG_PATH | sort | uniq -c | sort -rn | head -n 5 | awk '{
    for (i=2; i<=NF; i++){
      printf "%s ", $i
    }
    print "-", $1, "requests"
  }'
}

Top5Ip
Top5Path
Top5ResCode
Top5UserAgent
