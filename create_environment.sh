#!/usr/bin/bash
# This script creates a Python virtual environment and installs r

#equired packages.
read  -p"Enter your name:" my_name
mkdir -p submission_reminder_$my_name

main_dir="submission_reminder_$my_name"
#creating other directories
mkdir -p "$main_dir/app"
mkdir -p "$main_dir/modules"
mkdir -p "$main_dir/assets"
mkdir -p "$main_dir/config"

echo '# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2' > $main_dir/config/config.env


echo "student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Alicia, Git, submitted
Aline, Shell Navigation, not submitted
Keza, Git, submitted
Wilson, Shell Navigation, not submitted
Gania, Git, submitted" > $main_dir/assets/submissions.txt

echo '#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}' > $main_dir/modules/functions.sh

echo '#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file' > $main_dir/app/reminder.sh

echo '#!/bin/bash
if [ -f "./app/reminder.sh" ]; then
   ./app/reminder.sh
else
    echo "Error: reminder.sh not found! in the app directory."
    exit 1
fi
' > $main_dir/startup.sh

chmod +x $main_dir/startup.sh
chmod +x $main_dir/app/reminder.sh
chmod +x $main_dir/modules/functions.sh













