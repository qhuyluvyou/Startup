#!/bin/bash
set -e

sudo apt update && sudo apt upgrade -y
sudo apt install -y screen nano curl git wget openjdk-17-jdk p7zip-full unzip

curl -sSL https://raw.githubusercontent.com/qhuyluvyou/Startup/refs/heads/main/ngrok.sh | bash

mkdir Server
mkdir Hyr
mkdir Main

cd Main
touch eula.txt
echo "eula=true" >> eula.txt

touch startup.sh
echo "java -Xms50G -Xmx50G -jar paper.jar --nogui" >> startup.sh
chmod +x startup.sh
echo "alias qhuy='bash ~/Main/startup.sh'" >> ~/.bashrc

wget https://api.papermc.io/v2/projects/paper/versions/1.19.4/builds/550/downloads/paper-1.19.4-550.jar
cp paper-1.19.4-550.jar paper.jar

source ~/.bashrc

cd ~/Hyr
wget https://github.com/qhuyluvyou/Startup/raw/refs/heads/main/HYRONIC_SURVIVAL_v2.1.11.zip

unzip HYR*.zip
cd Hyr*
cp * ~/Main/.

cd ~/Main
sudo update-alternatives --set java /usr/lib/jvm/java-17-openjdk-amd64/bin/java

unzip spawn.zip

cd ~/Main
echo "done :3, start server with command 'qhuy'"
