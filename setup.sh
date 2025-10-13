# setup.shのディレクトリを取得
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# シンボリックリンクを安全に作成
if [ ! -L "$HOME/.claude" ] && [ ! -e "$HOME/.claude" ]; then
    ln -s "$SCRIPT_DIR/.claude" "$HOME/.claude"
    echo "✅ Created symlink: ~/.claude -> $SCRIPT_DIR/.claude"
else
    echo "⚠️  ~/.claude already exists, skipping symlink creation"
fi

if [ ! -L "$HOME/.claude.json" ] && [ ! -e "$HOME/.claude.json" ]; then
    ln -s "$SCRIPT_DIR/.claude.json" "$HOME"
    echo "✅ Created symlink: ~/.claude.json -> $SCRIPT_DIR/.claude.json"
else
    echo "⚠️  ~/.claude.json already exists, skipping symlink creation"
fi