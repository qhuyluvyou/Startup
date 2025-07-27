#!/usr/bin/env bash
set -e  # Dừng script nếu có lệnh nào fail

# Tên theme và URL
NEW_THEME="kali-like"
THEME_URL="https://api-lua.pages.dev/kali-like.zsh-theme"
THEME_FILE="kali-like.zsh-theme"
ZSHRC="$HOME/.zshrc"

# Cập nhật hệ thống và cài gói cần thiết
sudo apt update
sudo apt upgrade -y
sudo apt install -y tree zsh git curl wget unzip zip tar fastfetch

# Cài Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "✨ Cài Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Tải theme nếu chưa có
if [ ! -f "$HOME/$THEME_FILE" ]; then
  echo "🌐 Đang tải theme $NEW_THEME..."
  wget -O "$HOME/$THEME_FILE" "$THEME_URL"
fi

# Copy theme vào thư mục themes của Oh My Zsh
cp "$HOME/$THEME_FILE" "$HOME/.oh-my-zsh/themes/"

# Thay ZSH_THEME trong .zshrc
if grep -q '^ZSH_THEME=' "$ZSHRC"; then
  sed -i "s/^ZSH_THEME=.*/ZSH_THEME=\"$NEW_THEME\"/" "$ZSHRC"
else
  echo "ZSH_THEME=\"$NEW_THEME\"" >> "$ZSHRC"
fi

# Đổi shell mặc định sang zsh nếu chưa phải
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "⚙️  Đổi shell mặc định sang Zsh..."
  chsh -s "$(which zsh)" "$USER"
fi

# Khối cấu hình cần thêm
JAVA_BLOCK=$(cat <<'EOF'

# ====== JAVA ENV + Aikar Flags ======
export JAVA_HOME=~/jdk21
export PATH=$JAVA_HOME/bin:$PATH
alias sver='java -Xms1G -Xmx2G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar --nogui'
# ====================================
EOF
)

# Chèn vào cuối ~/.zshrc nếu chưa tồn tại
if ! grep -q 'alias sver=' "$ZSHRC"; then
  echo "$JAVA_BLOCK" >> "$ZSHRC"
  echo "✅ Đã thêm JAVA env và alias 'sver' vào ~/.zshrc"
else
  echo "⚠️  alias 'sver' đã có trong ~/.zshrc, bỏ qua"
fi

echo "✅ Hoàn tất! Đăng xuất rồi đăng nhập lại để Zsh hoạt động với theme \"$NEW_THEME\" 😎"
