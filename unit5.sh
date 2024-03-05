#!/bin/bash
# Sample Bash Script for Automating Report Download and Organization

# Define the URL of the report and the destination folder
LOGIN_URL="https://my.uopeople.edu/login/index.php"  # Replace with the actual login URL
REPORT_URL="https://my.uopeople.edu/pluginfile.php/1827750/mod_book/chapter/484710/Sample-Spreadsheet-1000-rows.csv"
DESTINATION_FOLDER="/home/mint/CS3307-Unit-5-WA"

# Prompt the user for their username and password
USERNAME = C1281972

authenticate() {
    echo "Authenticating..."
    wget --user-agent="Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)" \
    --save-cookies cookies.txt \
     --keep-session-cookies \
     --user $USERNAME \
     --ask-password \
     --max-redirect=10 \
     --trust-server-names \
     -O "${DESTINATION_FOLDER}/report.csv" \
     "$REPORT_URL"
}

# Function to organize the report by moving it to the designated folder
organize_report() {
    echo "Organizing the report..."
    mv "${DESTINATION_FOLDER}/report.csv" "${DESTINATION_FOLDER}/organized_reports/"  # Moving the report to a subfolder for organized reports
}

# Main script execution
authenticate
organize_report
echo "Report download and organization complete."