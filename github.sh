#!/bin/bash

# .env ファイルから環境変数を読み込む
if [[ -f ".env" ]]; then
    source ".env"
else
    echo "Error: .env ファイルが見つかりません。"
    exit 1
fi

# 一日の最大コミット回数を設定します（40回）
MAX_COMMITS_PER_DAY=40

# 一日の最大休憩時間（秒単位）を設定します（5時間）
MAX_BREAK_TIME=18000

# 辞書内の文章リスト
DICTIONARY=(
    "Improved error handling"
    "Refactored code for readability"
    "Added unit tests"
    "Fixed a bug in the application"
    "Optimized database queries"
    "Updated documentation"
    "Implemented a new feature"
    "Squashed a few minor bugs"
    "Enhanced user interface"
    "Reviewed and merged pull requests"
)

# ランダムな休憩時間を設定します
BREAK_TIME=$((RANDOM % MAX_BREAK_TIME))

# コミットの数だけループ
for ((i=1; i<=$MAX_COMMITS_PER_DAY; i++))
do
    # ランダムなコメントを生成
    COMMENT="${DICTIONARY[$RANDOM % ${#DICTIONARY[@]}]}: $(date)"

    # スクリプトのログにメッセージを表示
    echo "Commit: $COMMENT - $(date)"

    # コミットを行います
    git clone "https://github.com/$USERNAME/$REPO_NAME.git"
    cd $REPO_NAME
    echo $COMMENT >> README.md
    git add README.md
    git commit -m "$COMMENT"
    git push origin main
    cd ..

    # ランダムな時間（5分から1時間）でスリープ
    SLEEP_TIME=$(( (RANDOM % 3600) + 300 ))
    sleep $SLEEP_TIME
done

# 一日の残り時間を休憩に充てる
sleep $BREAK_TIME
