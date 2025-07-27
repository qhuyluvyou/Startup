#!/usr/bin/env bash
set -e

NEW_THEME="kali-like"
THEME_URL="https://api-lua.pages.dev/kali-like.zsh-theme"
THEME_FILE="kali-like.zsh-theme"
ZSHRC="$HOME/.zshrc"

sudo apt update
sudo apt upgrade -y
sudo apt install -y tree zsh git curl wget unzip zip tar fastfetch

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing OMZ"
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -f "$HOME/$THEME_FILE" ]; then
  echo "Downloading $NEW_THEME..."
  wget -O "$HOME/$THEME_FILE" "$THEME_URL"
fi

cp "$HOME/$THEME_FILE" "$HOME/.oh-my-zsh/themes/"

if grep -q '^ZSH_THEME=' "$ZSHRC"; then
  sed -i "s/^ZSH_THEME=.*/ZSH_THEME=\"$NEW_THEME\"/" "$ZSHRC"
else
  echo "ZSH_THEME=\"$NEW_THEME\"" >> "$ZSHRC"
fi

if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Changing default shell to ZSH"
  chsh -s "$(which zsh)" "$USER"
fi

JAVA_BLOCK=$(cat <<'EOF'

# ====== JAVA ENV + Aikar Flags ======
export JAVA_HOME=~/jdk21
export PATH=$JAVA_HOME/bin:$PATH
alias sver='java -Xms1G -Xmx2G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar --nogui'
# ====================================
EOF
)

if ! grep -q 'alias sver=' "$ZSHRC"; then
  echo "$JAVA_BLOCK" >> "$ZSHRC"
  echo "Sucessfully add Alias to .zshrc"
else
  echo "Alias already added, skip"
fi

echo "Done, relogin to apply new theme and shell"
