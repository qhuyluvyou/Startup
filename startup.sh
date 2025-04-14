sudo apt update && sudo apt upgrade -y && \
sudo apt install -y ufw screen openjdk-21-jdk && \
curl -fsSL https://tailscale.com/install.sh | sh && \
sudo systemctl unmask tailscaled && \
sudo systemctl start tailscaled && \
sudo tailscale up --auth-key=tskey-auth-kFjQJoDX6D21CNTRL-wtLGQLWew7CVTxogc7PH7C6X5hJgdkHw && \
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing' && \
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0 && \
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing' && \
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 0 && \
gsettings set org.gnome.desktop.session idle-delay 0 && \
cd Server && qhuy
