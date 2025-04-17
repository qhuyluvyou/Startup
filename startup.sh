sudo apt update && sudo apt upgrade -y && \
sudo apt install -y ufw screen openjdk-21-jdk xdotool && \
curl -fsSL https://tailscale.com/install.sh | sh && \
sudo systemctl unmask tailscaled && sudo systemctl start tailscaled && \
sudo tailscale up --login-server https://early-certain-walrus.ngrok-free.app --auth-key=5087899917683a91beb627cd83936bde6f7a174f914759bb && \
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing' && \
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0 && \
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing' && \
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 0 && \
gsettings set org.gnome.desktop.session idle-delay 0 && \
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target && \
sudo ln -sf /dev/null /sbin/shutdown && \
sudo ln -sf /dev/null /sbin/poweroff && \
sudo ln -sf /dev/null /sbin/reboot
