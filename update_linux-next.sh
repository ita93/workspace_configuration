#!/bin/sh
echo "Starting fetch linux-next"
git fetch linux-next
echo "Fetching linux-next finish $?"
echo "Starting fetch tag"
git fetch --tags linux-next
echo "Fetching task finis $?"
echo "Checkout master for safe"
git checkout master
echo "Update remote"
git remote update
echo "the newest tags"

latest_version=$(git tag -l "next-*" | tail -n1)
previous_version=$(cat .lastversion)
if [ "$latest_version" = "$previous_version" ]; then
    echo "equal $latest_version and $previous_version"
else
    echo "not equal $latest_version and $previous_version"
    echo "Creating a local branch for tag $latest_version ....."
    echo "\t Remove old my_local"
    git branch|grep -w my_local && git branch -D my_local
    echo "\t Checking out"
    git checkout -b my_local $latest_version
    if [ $? = 0 ]; then
        echo "\t Update record"
        echo "$latest_version" > .lastversion
        echo "Update done"
    else
        echo "Can not checkout"
    fi
fi
