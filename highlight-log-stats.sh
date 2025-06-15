#!/bin/bash

# צבעים עם tput
RED=$(tput setaf 1)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0)
BOLD=$(tput bold)

# קריאה מהקובץ והדפסה עם צבע
while IFS= read -r line; do
    if [[ "$line" == *ERROR* ]]; then
        echo "${BOLD}${RED}${line}${RESET}"
    elif [[ "$line" == *WARNING* || "$line" == *FAILED* ]]; then
        echo "${YELLOW}${line}${RESET}"
    else
        echo "$line"
    fi
done < log-analyzer-stats.txt
