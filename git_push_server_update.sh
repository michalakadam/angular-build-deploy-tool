#!/bin/bash

#Load configuration from a file
source CONFIG_FILE_LOCATION

#Inform server about changes being pushed
echo "Establishing connection with $ip_address"
ssh $su_name@$ip_address pull_and_build.sh $source_location_remotely $remote_repo_server_name $built_project_location
