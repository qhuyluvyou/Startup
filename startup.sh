apt update && sudo apt upgrade -y && \
apt install -y ufw screen openjdk-21-jdk xdotool && \
curl -fsSL https://tailscale.com/install.sh | sh && \
systemctl unmask tailscaled && \
systemctl start tailscaled && \
tailscale up --auth-key=tskey-auth-kFjQJoDX6D21CNTRL-wtLGQLWew7CVTxogc7PH7C6X5hJgdkHw && \
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing' && \
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0 && \
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing' && \
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 0 && \
gsettings set org.gnome.desktop.session idle-delay 0 && \
ln -sf /dev/null /sbin/shutdown
ln -sf /dev/null /sbin/poweroff
ln -sf /dev/null /sbin/reboot
curl -o xdotool.sh https://raw.githubusercontent.com/qhuyluvyou/Startup/refs/heads/main/Xdotool.sh
chmod +x xdotool.sh
screen -r loop
