# setup.shのディレクトリを取得
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# .claudeディレクトリをホームディレクトリに作成
if [ ! -d "$HOME/.claude" ]; then
    mkdir -p "$HOME/.claude"
    echo "✅ Created directory: $HOME/.claude"
else
    echo "⚠️  $HOME/.claude already exists, skipping directory creation"
fi

# .claudeディレクトリに.credentials.jsonのシンボリックリンクを作成（既存チェック付き）
if [ ! -L "$HOME/.claude/.credentials.json" ] && [ ! -e "$HOME/.claude/.credentials.json" ]; then
    ln -s "$SCRIPT_DIR/.credentials.json" "$HOME/.claude/.credentials.json"
    echo "✅ Created symlink: $HOME/.claude/.credentials.json -> $SCRIPT_DIR/.credentials.json"
elif [ -f "$HOME/.claude/.credentials.json" ] && [ ! -L "$HOME/.claude/.credentials.json" ]; then
    # 実ファイルが存在する場合は削除してシンボリンクを作成
    rm "$HOME/.claude/.credentials.json"
    ln -s "$SCRIPT_DIR/.credentials.json" "$HOME/.claude/.credentials.json"
    echo "✅ Replaced file with symlink: $HOME/.claude/.credentials.json -> $SCRIPT_DIR/.credentials.json"
else
    echo "⚠️  $HOME/.claude/.credentials.json already exists as symlink, skipping creation"
fi

# .claude.jsonのシンボリックリンクを作成（既存チェック付き）
if [ ! -L "$HOME/.claude.json" ] && [ ! -e "$HOME/.claude.json" ]; then
    ln -s "$SCRIPT_DIR/.claude.json" "$HOME"
    echo "✅ Created symlink: ~/.claude.json -> $SCRIPT_DIR/.claude.json"
elif [ -f "$HOME/.claude.json" ] && [ ! -L "$HOME/.claude.json" ]; then
    # 実ファイルが存在する場合は削除してシンボリンクを作成
    rm "$HOME/.claude.json"
    ln -s "$SCRIPT_DIR/.claude.json" "$HOME"
    echo "✅ Replaced file with symlink: ~/.claude.json -> $SCRIPT_DIR/.claude.json"
else
    echo "⚠️  ~/.claude.json already exists as symlink, skipping creation"
fi