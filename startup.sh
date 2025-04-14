sudo apt update && sudo apt upgrade -y && \
sudo apt install -y ufw screen openjdk-21-jdk && \
curl -fsSL https://tailscale.com/install.sh | sh && \
sudo systemctl unmask tailscaled && \
sudo systemctl start tailscaled && \
sudo tailscale up --auth-key=tskey-auth-kXJp9mDbTC11CNTRL-hyMFJM66zwVuHPmD7ZjRwVg78bjUiYAk && \
cd Server && qhuy
