#!/bin/bash

if [[ -f ".env" ]]; then
    source ".env"
else
    echo "Error: .env file not found"
    exit 1
fi

MAX_COMMITS_PER_DAY=40

MAX_BREAK_TIME=18000

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

BREAK_TIME=$((RANDOM % MAX_BREAK_TIME))

for ((i=1; i<=$MAX_COMMITS_PER_DAY; i++))
do
    COMMENT="${DICTIONARY[$RANDOM % ${#DICTIONARY[@]}]}: $(date)"

    echo "Commit: $COMMENT - $(date)"

    git clone "https://github.com/$USERNAME/$REPO_NAME.git"
    cd $REPO_NAME
    echo $COMMENT >> README.md
    git add README.md
    git commit -m "$COMMENT"
    git push origin main
    cd ..

    SLEEP_TIME=$(( (RANDOM % 3600) + 300 ))
    sleep $SLEEP_TIME
done

sleep $BREAK_TIME
