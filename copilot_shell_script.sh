#!/bin/bash
# User enters name
read -p "Enter the name: " My_name

# Validate that the name is not empty
if [[ -z $My_name ]]; then
    echo "Name can't be empty. Please run the script again with a valid name."
    exit 1
fi

# Validate that the name contains only alphabets
if [[ ! "$My_name" =~ ^[a-zA-Z]+$ ]]; then
    echo "Invalid name. Use alphabetic characters only."
    exit 1
fi

# Change name to lowercase and create directory
My_name=$(echo "$My_name" | tr '[:upper:]' '[:lower:]')
dir="submission_reminder_$My_name"
mkdir -p "$dir"

submission_file="$dir/assets/submissions.txt"
conf_file="$dir/config/config.env"

# Checking if the directory exists
if [[ ! -d "$dir" ]]; then
    echo "Directory '$dir' doesn't exist."
    exit 1
fi

# Asking user for assignment name and days remaining
read -p "Enter assignment name: " Assign
read -p "Enter days remaining : " Days_Remaining

# Validate user inputs
if [[ -z "$Assign" ]]; then
    echo "Assignment name can't be empty. Provide a valid input."
    exit 1
fi

if [[ -z "$Days_Remaining" ]]; then
    echo "Days remaining can't be empty."
    exit 1
fi

Days_Remaining=$(echo "$Days_Remaining" | xargs)

if [[ ! "$Assign" =~ ^[a-zA-Z\ ]+$ ]]; then
    echo "Invalid assignment name. Assignment should only have letters and spaces."
    exit 1
fi

if [[ ! $Days_Remaining =~ ^[0-9]+$ ]]; then
    echo "Days remaining should be a positive."
    exit 1
fi

matching_assignment=$(grep -i ", *$Assign," "$submission_file" | awk -F, '{print $2}' | head -n1 | xargs)
if [[ -z "$matching_assignment" ]]; then
    echo "No match for assignment found in submissions.txt."
    exit 1
fi

cat <<EOF > "$conf_file"
# Config file for submission reminder app
ASSIGNMENT="$Assign"
DAYS_REMAINING=$Days_Remaining
EOF

read -p "Do you want to run this application? (y/n): " run

if [[ "$run" =~ ^[Yy]$ ]]; then
    echo "Running this application"
    cd "$dir"
    ./startup.sh
else
    echo "You can run the application by executing $dir/app/reminder.sh and execute ./startup.sh"
fi