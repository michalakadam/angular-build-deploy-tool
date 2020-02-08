#!/bin/bash

source_location=$1
repo_name=$2
built_project_location=$3
echo "Remote server triggered, attempting to pull changes from remote repository."

echo "Opening project directory $source_location"
cd $source_location

#make sure that pushed changes are already there
sleep 3

git pull $repo_name master
if [ $? -eq 1 ]; then
        echo "Deployment not successful."
	exit 1
fi

ng build --prod
if [ $? -eq 0 ]; then
	echo "Project built successfully."
fi

cp -r ./dist $built_project_location
if [ $? -eq 0 ]; then
        echo "Changes deployed!"
fi

