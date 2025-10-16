# Submission Reminder App

A shell-based application to help students and instructors track assignment deadlines and send reminders for pending submissions.

---

## Table of Contents
- [Features](#features)
- [Setup Instructions](#setup-instructions)
- [Update Assignment & Days](#update-assignment--days)
- [File Structure](#file-structure)
- [Script Details](#script-details)
- [Customization](#customization)
- [Example Workflow](#example-workflow)
- [Example Output](#example-output)
- [Troubleshooting](#troubleshooting)
- [Contact](#contact)

---

## Features
- Create a personalized workspace for tracking submissions
- View students who have not submitted assignments
- Easily update assignment and deadline information
- Sample data for testing and demonstration
- Modular scripts for easy customization

---

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/Alicia-Keza/submission_reminder_app_Alicia-Keza.git
cd submission_reminder_app_Alicia-Keza
```

### 2. Create the Environment
Run the environment setup script to scaffold your workspace:
```bash
bash create_environment.sh
```
- Enter your name when prompted (letters only).
- The script creates a directory named `submission_reminder_<yourName>` with all required subfolders and files.
- Sample student records are added to `assets/submissions.txt`.
- All shell scripts are made executable.
- A placeholder `image.png` is created for future UI or documentation use.

### 3. Run the Reminder App
Change into your workspace and start the app:
```bash
cd submission_reminder_<yourName>
./startup.sh
```
- This prints the assignment, days remaining, and lists students who have not submitted.
- The script automatically sets executable permissions for all `.sh` files in the workspace.

---

## Update Assignment & Days

Use the copilot shell script to update the assignment and days remaining in your workspace config:
```bash
bash copilot_shell_script.sh
```
- Enter your name (letters only) when prompted.
- Enter the assignment name and days remaining.
- The script updates `config/config.env` and reruns the reminder app.
- Input validation ensures only valid names, assignments, and days are accepted.

---

## File Structure
```
submission_reminder_<yourName>/
├── app/
│   └── reminder.sh         # Main script to check and remind
├── modules/
│   └── functions.sh        # Helper functions for reminders
├── assets/
│   └── submissions.txt     # Student submissions data
├── config/
│   └── config.env          # Assignment and deadline config
├── image.png               # Placeholder for future use
└── startup.sh              # Script to launch the reminder app
```

---

## Script Details

### create_environment.sh
- Prompts for your name and creates a workspace directory.
- Sets up subfolders and files with sample data.
- Makes all `.sh` files executable.
- Adds a placeholder image file for future UI or documentation.

### copilot_shell_script.sh
- Prompts for your name, assignment, and days remaining.
- Validates input and updates `config/config.env`.
- Reruns the reminder app to show updated results.
- Ensures the assignment exists in the submissions file before updating.

### startup.sh
- Checks for `app/reminder.sh` and runs it.
- Prints error if not found.
- Sets executable permissions for all `.sh` files in the workspace.

---

## Customization
- You can edit `assets/submissions.txt` to add or update student records. Keep the CSV header and format.
- You can modify `config/config.env` directly or use the copilot script to change assignment and deadline.
- Add more scripts or features by placing them in the appropriate subdirectory.

---

## Example Workflow
1. Run `create_environment.sh` and enter your name (e.g., "Alicia").
2. Enter the workspace: `cd submission_reminder_Alicia`
3. Run the app: `./startup.sh` — see reminders for students who haven't submitted.
4. Update the assignment: `bash ../copilot_shell_script.sh` — enter new assignment and days, see updated reminders.
5. Edit `assets/submissions.txt` to add more students or assignments as needed.

---

## Example Output
```
Assignment: Shell Navigation
Days remaining to submit: 2 days
--------------------------------------------
Reminder: Chinemerem has not submitted the Shell Navigation assignment!
Reminder: Divine has not submitted the Shell Navigation assignment!
... (other reminders)
```

---

## Troubleshooting
- If `./startup.sh` prints "reminder.sh not found", verify you are inside the workspace directory and that `app/reminder.sh` exists.
- If scripts are not executable: `chmod +x *.sh app/*.sh modules/*.sh startup.sh`
- If assignment is not found, check the spelling and format in `assets/submissions.txt`.

---

## Contact
- Developer: Alicia Keza
- Email: kezalicia257@gmail.com
- GitHub: [Alicia-Keza](https://github.com/Alicia-Keza)

