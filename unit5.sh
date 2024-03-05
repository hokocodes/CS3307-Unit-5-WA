#!/bin/bash
# Sample Bash Script for Automating Report Download and Organization

# Define the URL of the report and the destination folder
LOGIN_URL="https://my.uopeople.edu/login/index.php"  # Replace with the actual login URL
REPORT_URL="https://my.uopeople.edu/pluginfile.php/1827750/mod_book/chapter/484710/Sample-Spreadsheet-1000-rows.csv"
DESTINATION_FOLDER="/home/mint/CS3307-Unit-5-WA"

# Prompt the user for their username and password
echo "Please enter your username:"
read USERNAME
echo "Please enter your password:"
read -s PASSWORD  # The -s flag hides the input for privacy

authenticate() {
    echo "Authenticating..."
    wget --save-cookies cookies.txt \
     --keep-session-cookies \
     --post-data 'user=$USERNAME&password=$PASSWORD' \
     --delete-after \
         "$LOGIN_URL"
}

# Function to download the report using wget
download_report() {
    echo "Downloading the report..."
    wget --load-cookies cookies.txt \
         --user "$USERNAME" \
         --password "$PASSWORD" \
         --content-disposition \
         -O "${DESTINATION_FOLDER}/report.csv" \
         "$REPORT_URL"
}

# Function to organize the report by moving it to the designated folder
organize_report() {
    echo "Organizing the report..."
    mv "${DESTINATION_FOLDER}/report.csv" "${DESTINATION_FOLDER}/organized_reports/"  # Moving the report to a subfolder for organized reports
}

# Main script execution
download_report
organize_report
echo "Report download and organization complete."