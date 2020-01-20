#!/bin/bash

#Load configuration from a file
source ./config

#Go to code directory
cd $project_full_path

#Push changes to remote repo
git push origin master
if [ $? -eq 0 ]; then
	echo "Push attempt successful"
fi

#Inform server about changes being pushed
ssh $user@$address time_to_pull
