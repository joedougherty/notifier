#!/bin/bash

usbdevice="/dev/tty.usbmodem1411"
notifier_command="python /Users/josephdougherty/notifier/notify.py"

# Find the pid of the Screen session w/ Notifier running
SCREENPID=$(ps aux | grep pynotifier | grep -v grep | awk {'print $2'})
if [ -z "$SCREENPID" ]; then 
  echo "No pre-existing pynotifier session found. [OK]"
else
  echo "Killing pre-existing pynotifier session."  
  kill $SCREENPID
  screen -wipe # cleanup dead screen sessions
fi

# Start Growl if it isn't already running
GROWLID=$(pgrep Growl)
if [ -z "$GROWLID" ]; then
  echo "Starting Growl..."
  open -b com.Growl.GrowlHelperApp 
fi

if [ -e "$usbdevice" ]; then
    echo 'USB connected. [OK]'
    # Start new pynotifier session
    echo "Initializing new pynotifier session. [OK]"
    screen -S pynotifier -d -m $notifier_command
else
    echo 'USB not connected. [ERROR]'
    echo 'Connect USB device and try again.'
fi
