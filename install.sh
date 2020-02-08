#!/bin/bash

is_action_successful(){
	program_name=$1
	exit_code=$2
	action=${3:-INSTALLED}
	if [[ $exit_code -eq 0 ]] ; then
		printf '\e[32m%-6s\e[m' "$program_name $action"
	else
		printf '\e[31m%-6s\e[m' "$program_name NOT $action"
		echo -e "\n"
		exit 1
	fi
	echo -e "\n"
}

sudo echo "Welcome to Angular deployment installation!"

#get and edit config file
script_name="config"
curl https://raw.githubusercontent.com/michalakadam/angular-build-deploy-tool/master/$script_name -o $(pwd)/$script_name
is_action_successful "$script_name file" $? "downloaded from github.com/michalakadam/angular-build-deploy-tool repository"

#fill config file with user's values

gather_input_from_user(){
	variable_name=$1
	prompt=$2
	default_value=${3:-''}
	value=''
	while [[ $value == '' ]]
	do 
		if [[ $default_value == '' ]]; then
			read -p "$prompt: " value
		else
			read -p "Provide $prompt[$default_value]: " value
			value=${value:-$default_value}
		fi		
	done 
		add_to_config_file $variable_name $value
		echo -e "\n"
}

add_to_config_file(){
	variable_name=$1
	value=$2
	sed -i "s@$variable_name@$variable_name=\"$value\"@g" $(pwd)/config
}

gather_input_from_user source_location_locally "absolute path of your angular project folder on your local machine"

gather_input_from_user source_location_remotely "absolute path of your angular project folder on the remote server"

gather_input_from_user su_name "super user name at the remote server" "root"

gather_input_from_user ip_address "ip address of the remote server"

gather_input_from_user remote_repo_local_name "name of remote repository on local machine" "origin"

gather_input_from_user remote_repo_server_name "name of remote repository on the server" "origin"

gather_input_from_user built_project_location "location for compiled webapp on remote server" "/var/www"

#Load configuration provided by user from config file
source $(pwd)/config

#move config file to project folder
cp $(pwd)/config $source_location_locally/deployment_script_config 

#add config file to project .gitignore
cat <<EOT >> $source_location_locally/.gitignore

#files related to Angular project deployment
deployment_script_config
deploy.sh
EOT

#get script for local machine
script_name=git_push_server_update.sh
sudo curl https://raw.githubusercontent.com/michalakadam/angular-build-deploy-tool/master/$script_name -o $source_location_locally/deploy.sh

sudo chmod u+x $source_location_locally/deploy.sh

#load config file in the deployment script
sudo sed -i "s@CONFIG_FILE_LOCATION@$source_location_locally/deployment_script_config@g" $source_location_locally/deploy.sh

#download remote server script to remote server
script_name=pull_and_build.sh
ssh $su_name@$ip_address "curl https://raw.githubusercontent.com/michalakadam/angular-build-deploy-tool/master/$script_name > /usr/bin/$script_name && sudo chmod u+x /usr/bin/$script_name"
is_action_successful "$script_name file" $? "downloaded from repository to $ip_address at /usr/bin/$script_name"

#remove installation script when the job is done
rm $(pwd)/config
rm -- "$0"
