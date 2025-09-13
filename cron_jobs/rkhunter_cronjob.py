#!/usr/bin/env python3

# Rkhunter Check Script (Python Version)
# Runs rkhunter, compares the output with the last run, and sends an email if changes are detected.

import os
import shutil
import subprocess
from datetime import datetime
from pathlib import Path
import smtplib
from email.mime.text import MIMEText
import sys
import re

# Get hostname for the email subject
try:
    HOSTNAME = subprocess.check_output("hostname", text=True).strip()
except (subprocess.CalledProcessError, FileNotFoundError):
    HOSTNAME = "this server"

SUBJECT = f"Rkhunter Alert on {HOSTNAME}"
LOG_DIR = Path("/var/log/rkhunter_check")
CURRENT_LOG = LOG_DIR / "rkhunter_current.log"
PREVIOUS_LOG = LOG_DIR / "rkhunter_previous.log"

SMTP_SERVER = "smtp.mail.yahoo.com"
SMTP_PORT = 587
SMTP_USERNAME = "jcmcarreira"
SMTP_PASSWORD = ""
EMAIL_FROM = "jcmcarreira@yahoo.com"
EMAIL_TO = "jokarreira@gmail.com"
EMAIL_SUBJECT = "rkhunter changed:"
def send_email(subject, body):
    msg = MIMEText(body)
    msg['Subject'] = subject
    msg['From'] = EMAIL_FROM
    msg['To'] = EMAIL_TO
    debuglevel = True
    mail = smtplib.SMTP(SMTP_SERVER, SMTP_PORT)
    mail.set_debuglevel(debuglevel)
    mail.starttls()
    mail.login(SMTP_USERNAME, SMTP_PASSWORD)
    mail.sendmail(EMAIL_FROM, EMAIL_TO, msg.as_string())
    mail.quit()

def run_command(command, log_file):
    """Runs a command and appends its stdout and stderr to the log file."""
    print(f"running command: {command}")
    try:
        # Using shell=True for simplicity with commands that might have pipes or redirects,
        # but commands are hardcoded, reducing security risks.
        result = subprocess.run(
            command, shell=True, capture_output=True, text=True,
            check=False  # Do not raise an exception on a non-zero exit code
        )
        with open(log_file, "a") as f:
            f.write(f"\n--- Running: {command} ---\n")
            f.write(result.stdout)
            if result.stderr:
                f.write("\n--- Stderr ---\n")
                f.write(result.stderr)
    except Exception as e:
        with open(log_file, "a") as f:
            f.write(f"\n--- An unexpected error occurred with command: {command} ---\n")
            f.write(f"{e}\n")

def main():
    LOG_DIR.mkdir(parents=True, exist_ok=True)

    if CURRENT_LOG.exists():
        shutil.move(str(CURRENT_LOG), str(PREVIOUS_LOG))

    with open(CURRENT_LOG, "w") as f:
        f.write(f"Starting rkhunter scan at {datetime.now().isoformat()}\n")

    run_command("rkhunter --update", CURRENT_LOG)
    run_command("rkhunter --propupd", CURRENT_LOG)
    run_command("rkhunter --cronjob --report-warnings-only", CURRENT_LOG)

    with open(CURRENT_LOG, "a") as f:
        f.write(f"\nRkhunter scan finished at {datetime.now().isoformat()}\n")

    # Compare logs and send email if necessary
    if PREVIOUS_LOG.exists():
        try:
            # Use diff to compare the log files
            result = subprocess.run( ["diff", str(PREVIOUS_LOG), str(CURRENT_LOG)],
                capture_output=True, text=True, check=False)
            differences = result.stdout.split("\n")
            rest = []
            for line in differences:
                if "Starting rkhunter scan" not in line and "Rkhunter scan finished" not in line and "---" not in line and line:
                    if not re.match(r"^(\d)+c(\d)+$", line):
                        rest.append(line)
            if rest:
                print("Changes detected. Sending email alert.")
                email_body = (
                    "The rkhunter scan results have changed since the last run.\n\n"
                    "Please review the differences below:\n\n"
                    f"{differences}\n\n"
                    f"You can view the full current log at: {CURRENT_LOG}"
                )
                send_email(SUBJECT, email_body)
            else:
                print("No changes detected since the last scan.")
        except FileNotFoundError:
            print("Error: 'diff' command not found. Cannot compare log files.")

    else:
        # This is the first run, so no previous log exists
        print("No previous log found. Sending initial report.")
        email_body = "This is the first rkhunter scan. The output is attached."
        send_email( f"Initial Rkhunter Run on {HOSTNAME}", email_body
        )

if __name__ == "__main__":
    if os.geteuid() != 0:
        print("This script requires root privileges. Please run with 'sudo'.")
        exit(1)
    main()

