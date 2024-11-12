#!/bin/bash
# Wait for system services to fully initialize
sleep 10

# Check if SELECT button is held
evtest --query /dev/input/event2 EV_KEY BTN_SELECT
if [ "$?" -eq "10" ]; then
    echo "SELECT button held - launching EmulationStation"
    exit 0
fi

# Set CPU governor to powersave to minimize audio crackles
echo "powersave" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

# Configure m8c idle_ms
sed -i "/^idle_ms=/s/=.*/=25/" ~/.local/share/m8c/config.ini

# Run MIDI connection script
python3 /roms/m8/midi_connect.py

# Give MIDI time to connect
sleep 2

# Launch M8
cd /roms/m8
./M8.sh

# If M8 exits or crashes, launch EmulationStation as fallback
cd /usr/bin/emulationstation
./emulationstation
