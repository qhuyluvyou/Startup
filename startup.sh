sudo apt update && sudo apt upgrade -y && \
sudo apt install -y ufw screen openjdk-21-jdk && \
curl -fsSL https://tailscale.com/install.sh | sh && \
sudo systemctl unmask tailscaled && \
sudo systemctl start tailscaled && \
sudo tailscale up --auth-key=tskey-auth-kRUzmudqjH11CNTRL-SF627ePitxBaoKqAQLxcyBU9XS9ejQ9d && \
cd Server && qhuy
