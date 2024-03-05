#!/bin/bash
# Sample Bash Script for Automating Report Download and Organization

# Define the URL of the report and the destination folder
REPORT_URL="https://my.uopeople.edu/pluginfile.php/1827750/mod_book/chapter/484710/Sample-Spreadsheet-1000-rows.csv"
DESTINATION_FOLDER="/path/to/folder"

# Function to download the report using wget
download_report() {
    echo "Downloading the report..."
    wget -O "${DESTINATION_FOLDER}/report.csv" "$REPORT_URL"  # Using wget to download the file to the destination folder
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