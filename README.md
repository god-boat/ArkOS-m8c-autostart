# Creating and Configuring Autostart Script

## Create Autostart File
Create then edit an autostart file:
nano ~/.config/autostart/autostart.sh
Add code from autostart.sh file in this repo

## Make Script Executable
Make it executable:
chmod +x ~/.config/autostart/autostart.sh

# Modifying EmulationStation Configuration 

## Backup Original Script
Modify the EmulationStation startup script:
sudo cp /usr/bin/emulationstation/emulationstation.sh /usr/bin/emulationstation/emulationstation.sh.backup

## Edit EmulationStation Script
sudo nano /usr/bin/emulationstation/emulationstation.sh

## Locate Target Section
Find this section in emulationstation.sh:
else
  esdir="$(dirname $0)"
  while true; do
      rm -f /tmp/es-restart /tmp/es-sysrestart /tmp/es-shutdown
      "$esdir/emulationstation" "$@"

## Replace Command
Replace "$esdir/emulationstation" "$@" with:
/home/ark/.config/autostart/autostart.sh || "$esdir/emulationstation" "$@"
