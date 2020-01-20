#!/bin/bash

echo "Remote server triggered, attempting to pull changes from remote repository."

echo "Opening project directory $1"
cd $1

#make sure that pushed changes are already there
sleep 3

git pull $2 master

ng build --prod
if [ $? -eq 0 ]; then
	echo "Project built successfully."
fi

cp -r ./dist $3
if [ $? -eq 0 ]; then
        echo "Changes deployed!"
fi

