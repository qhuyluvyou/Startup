sudo apt update && sudo apt upgrade -y && \
sudo apt install -y ufw screen openjdk-21-jdk xdotool && \
curl -fsSL https://tailscale.com/install.sh | sh && \
sudo systemctl unmask tailscaled && sudo systemctl start tailscaled && \
sudo tailscale up --login-server https://early-certain-walrus.ngrok-free.app --auth-key=f4381c71bedf549e20eb06d176cf368cfb4a39a28d3814c0 && \
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing' && \
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0 && \
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing' && \
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 0 && \
gsettings set org.gnome.desktop.session idle-delay 0 && \
sudo ln -sf /dev/null /sbin/shutdown
sudo ln -sf /dev/null /sbin/poweroff
sudo ln -sf /dev/null /sbin/reboot
