#!/bin/bash

#Load configuration from a file
source CONFIG_FILE_LOCATION

if [[ $1 == "-nt" || $1 == "--no-tests" ]]; then
	echo "Skipping tests execution."
else
        echo "Executing unit tests for the Angular app..."
        ng test --progress=true
fi

#Inform server about changes being pushed
echo "Establishing connection with $ip_address"
ssh $su_name@$ip_address pull_and_build.sh $source_location_remotely $remote_repo_server_name $built_project_location
