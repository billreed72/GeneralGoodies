#!/bin/sh
# Author: William L Reed Nov 2014
clear
days='+10'
logName='staff'
logDir='/opt/gads/logs'
logArchDir="$logDir/archive"
logArchName="$logName*.log"
# Analyze
gads_started() {
  egrep 'usersyncapp.cli.Sync\] Starting' $logDir/$logName.log 2>&1 | cut -c 1-26
  }
gads_finished() {
  egrep 'usersyncapp.cli.Sync\] No updates' $logDir/$logName.log 2>&1 | cut -c 1-26
  }
proposed_change_report() {
  egrep -A 9 'Proposed Change Report' $logDir/$logName.log 2>&1
  }
change_status_report() {
  egrep -A 23 'Change Status Report' $logDir/$logName.log 2>&1
  }
# Archive
LIST_gads_logs() {
  echo "PROPOSED rename & move-to location:"
  echo "Source: $logDir/$logName.log"
  echo "Destination: $logArchDir/$logName_$(date +%Y)_$(date +%m)_$(date +%d)_$(date +%H%M%S).log"
  }
MOVE_gads_logs() {
  echo "$logName.log has been renamed and moved:"
  mv $logDir/$logName.log $logArchDir/$logName_$(date +%Y)_$(date +%m)_$(date +%d)_$(date +%H%M%S).log
  echo "Source: $logDir/$logName.log"
  echo "Destination: $logArchDir/$logName_$(date +%Y)_$(date +%m)_$(date +%d)_$(date +%H%M%S).log"
  }
# Purge
LIST_arch_logs() {
  echo "PROPOSED list of archived logs to be purged."
  find $logArchDir -mtime $days -name $logArchName -printf '%p (%k kb)\n'
  }
PURGE_arch_logs() {
  echo "List of archived logs being purged."
  find $logArchDir -mtime $days -name $logArchName -exec rm -f {} \; 2>/dev/null
  }
echo '==================================================='
echo "Date: $(date)"
echo "Host: $(hostname)"
echo
echo "Before each sync, the following will be performed:"
echo "     1. Log file is Analyzed: "$logDir/$logName
echo "     2. Then archived & timestamped to: "$logArchDir
echo "     3. Purge of archived logs $days or older"
echo '==================================================='
echo '>>>>>>>> ANALYSIS <<<<<<<<'
echo '==================================================='
echo "Start Time: "
gads_started
echo "Finished Time: "
gads_finished
echo
proposed_change_report
change_status_report
echo '==================================================='
echo '>>>>>>>> ARCHIVE <<<<<<<<<'
echo '==================================================='
LIST_gads_logs
#MOVE_gads_logs
echo '==================================================='
echo '>>>>>>>> PURGE <<<<<<<<<<<'
echo '==================================================='
LIST_arch_logs
#PURGE_arch_logs
echo '==================================================='
