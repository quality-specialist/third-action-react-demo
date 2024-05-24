#!/bin/sh

# Check if Git is initialized, and initialize if necessary
if [ ! -d ".git" ]; then
    git init
    git remote add origin $REMOTE_URL
    echo "Git repository initialized and remote set."
else
    if git remote get-url origin > /dev/null 2>&1; then
        git remote set-url origin $REMOTE_URL
        echo "Git repository already initialized, remote URL updated."
    else
        git remote add origin $REMOTE_URL
        echo "Git repository already initialized, remote 'origin' added."
    fi
fi

# Start the main process
exec "$@"
