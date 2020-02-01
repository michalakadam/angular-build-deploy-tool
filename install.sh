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

#get and edit config file
curl https://raw.githubusercontent.com/michalakadam/angular-build-deploy-tool/master/config -o $(pwd)/config_test
is_action_successful "config file" $? "downloaded from github.com/michalakadam/angular-build-deploy-tool repository"

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
}

add_to_config_file(){
	variable_name=$1
	value=$2
	echo $variable_name
	echo $value
	sed -i "s@$variable_name@$variable_name=\"$value\"@g" $(pwd)/config_test
}

gather_input_from_user source_location_locally "absolute path of your angular project folder on your local machine"

gather_input_from_user source_location_remotely "absolute path of your angular project folder on the remote server"

gather_input_from_user root_name "super user name at the remote server" "root"

gather_input_from_user ip_address "ip address of the remote server"

gather_input_from_user remote_repo_local_name "name of remote repository on local machine" "origin"

gather_input_from_user remote_repo_server_name "name of remote repository on the server" "origin"

gather_input_from_user built_project_location "location for compiled webapp on remote server" "/var/www"


