#!/bin/bash
SERVICE_NAME="fn-lock-toggle"
SCRIPT_PATH="/usr/bin/$SERVICE_NAME.sh"
SERVICE_PATH="/lib/systemd/system/$SERVICE_NAME.service"
if [[ $1 == 'uninstall' ]]; then
  systemctl stop $SERVICE_NAME
  systemctl disable $SERVICE_NAME
  rm $SERVICE_PATH 
  rm $SCRIPT_PATH
  exit 0
fi
SERVICE="
[Unit]\n
Description=Toggles fn lock on start\n
\n
[Service]\n
Type=simple\n
ExecStart=/bin/bash $SCRIPT_PATH\n
\n
[Install]\n
WantedBy=multi-user.target\n
"

SCRIPT="
#!/bin/bash\n
while [[ ! -d /sys/module/hid\_apple/parameters/ ]]; do sleep 1s; done\n
echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode
"

echo -e $SCRIPT > $SCRIPT_PATH
echo -e $SERVICE > $SERVICE_PATH
chmod +x $SCRIPT_PATH
systemctl start fn-lock-toggle
systemctl enable fn-lock-toggle
