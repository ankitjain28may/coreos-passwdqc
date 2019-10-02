#!/bin/sh

set -e

# pam_passwdqc binary
cp /pam_passwdqc/pam_passwdqc.so /pam_passwdqc/lib64/pam_passwdqc.so

# SSH Config
unlink /etc/ssh/sshd_config
cp sshd_config /etc/ssh/sshd_config

# PAM Files
cp system-login /pam.d
cp passwd /pam.d

# Create opasswd file
touch /etc/security/opasswd
chown root:root /etc/security/opasswd
chmod 600 /etc/security/opasswd

# Changing password max-days and min-days
# Edit the file -> /etc/login.defs
# PASS_MAX_DAYS	30
# PASS_MIN_DAYS	0
# PASS_WARN_AGE 7

# sudo useradd -U -m ankit.jain -G sudo -K PASS_MAX_DAYS=30 -K PASS_MIN_DAYS=0 && sudo passwd ankit.jain
# sudo passwd -e ankit.jain
# ssh ankit.jain@localhost
# sudo chage -l ankit.jain
