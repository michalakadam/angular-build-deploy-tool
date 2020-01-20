#!/bin/bash

#Load configuration from a file
source ./config

#Go to code directory
cd $source_location_locally

#Push changes to remote repo
git push origin master

#Inform server about changes being pushed
ssh $user@$address time_to_pull $source_location_remotely $remote_repo_server_name
