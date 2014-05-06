#!/bin/bash
#
# Sync Reports Folders
#

. ~/set_oracle_env.sh

SOURCE=${LOG}/Reports_Replacements/
DEST=${DOMAIN_HOME}/config/fmwconfig/servers/WLS_REPORTS/applications/reports_11.1.2/

# Start Log
echo "Starting sync (`date`)..." > ~/sync.log

# Sync Folders
# -a -- archive mode (recursive, preserve file permissions, etc)
# -t -- save last modified date
# -v -- verbose
# -u -- skip files that haven't been modified
# --delete -- delete files that are no longer in source directory
rsync -atvu --delete $SOURCE $DEST >> ~/sync.log

# Make log viewable by everyone
chmod 755 ~/sync.log
