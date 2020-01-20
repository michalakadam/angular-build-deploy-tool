#!/bin/bash

#Load configuration from a file
source ./config

#Go to code directory
echo "Opening project directory $source_location_locally"
cd $source_location_locally

#Push changes to remote repo
echo "Pushing local changes to $remote_repo_local_name"
git push origin master

#Inform server about changes being pushed
echo "Establishing connection with $address"
ssh $user@$address time_to_pull $source_location_remotely $remote_repo_server_name $built_project_location
