#!/bin/bash

echo "______________________________                       "
echo "\\______   \\______   \\______   \\__  _  ______  "
echo " |     ___/|     ___/|     ___/\\ \\/ \\/ /    \\ "
echo " |    |    |    |    |    |     \\     /   |  \\     "
echo " |____|    |____|    |____|      \\/\\_/|___|  /    "
echo "                                           \\/       "
echo " __                 __      _____                    " 
echo "|  |  __ __   ____ |  | ___/ ____\\_______  ___      "
echo "|  | |  |  \\_/ ___\\|  |/ /\\   __\\/  _ \\  \\/  / "
echo "|  |_|  |  /\\  \\___|    <  |  | (  <_> >    <      "
echo "|____/____/  \\_____>__|_ \\ |__|  \\____/__/\\_ \\  "
echo ""

echo "v1.0.0" 
echo "Recompiled by Oresterosso TeamItalianModder"
echo ""
echo "https://github.com/0x1iii1ii/PPPwn-Luckfox"
echo "https://github.com/TheOfficialFloW/PPPwn"
echo "https://github.com/xfangfang/PPPwn_cpp"
echo ""

# Display the list of firmware versions
echo "Please select your PS4 firmware version:"
echo "a) 9.00"
echo "b) 9.60"
echo "c) 10.00"
echo "d) 10.01"
echo "e) 11.00"
echo ""
# Prompt the user for the selection
read -p "Enter your choice (a/b/c/d/e): " FW_CHOICE

# Set the firmware version based on the user's choice
declare -A fw_versions=(
    [a]="900"
    [b]="960"
    [c]="1000"
    [d]="1001"
    [e]="1100"
)

FW_VERSION=${fw_versions[$FW_CHOICE]}

if [ -z "$FW_VERSION" ]; then
    echo "Invalid choice. Exiting."
    exit 1
fi

# Confirm the firmware version selection
echo "You have selected firmware version $FW_VERSION. Is this correct? (y/n)"
read -p "Enter your choice: " CONFIRMATION

if [[ $CONFIRMATION != "y" ]]; then
    echo "Firmware selection not confirmed. Exiting."
    exit 1
fi

# Define the paths for the stage1 and stage2 files based on the firmware version
STAGE1_FILE="stage1/$FW_VERSION/stage1.bin"
STAGE2_FILE="stage2/$FW_VERSION/stage2.bin"

# Create the execution script with the user inputs
cat <<EOL > /root/PPPwn/pppwn_script.sh
#!/bin/bash

# Define variables
FW_VERSION=$FW_VERSION
STAGE1_FILE="$STAGE1_FILE"
STAGE2_FILE="$STAGE2_FILE"

# Disable eth0
ifconfig eth0 down

# Wait a second
sleep 1

# Enable eth0
ifconfig eth0 up

# Wait a second
sleep 1

# Change to the directory containing the pppwn executable
cd /root/PPPwn/

# Execute the pppwn command with the desired options
./pppwn --interface eth0 --fw \$FW_VERSION --stage1 "\$STAGE1_FILE" --stage2 "\$STAGE2_FILE" -a -t 5 -nw -wap 2

# Check if the pppwn command was successful
if [ \$? -eq 0 ]; then
    echo "pppwn execution completed successfully."
    sleep 10
    ifconfig eth0 down
    sleep 5
    halt
else
    echo "pppwn execution failed. Exiting script."
    exit 1
fi
EOL

# Make the pppwn script executable
chmod +x /root/PPPwn/pppwn_script.sh
chmod +x /root/PPPwn/pppwn

# Create the pppwn OpenRC service file
cat <<EOL > /etc/init.d/pppwn
#!/sbin/openrc-run

description="PPPwn Script Service"
pidfile="/run/pppwn.pid"

depend() {
    need localmount net
}

start() {
    ebegin "Starting PPPwn Script Service"
    /root/PPPwn/pppwn_script.sh &
    eend $?
}

stop() {
    ebegin "Stopping PPPwn Script Service"
    pkill -f "/root/PPPwn/pppwn_script.sh"
    eend $?
}
EOL

# Make the OpenRC service script executable
chmod +x /etc/init.d/pppwn

# Add the pppwn service to the default runlevel
rc-update add pppwn default

echo "Install completed! Rebooting..."

# Reboot using su
su -c "reboot"

