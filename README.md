# Tool for building and deploying Angular web application on remote server

### Requirements
* access over ssh to remote server hosting web app
* web app already served using nginx(https://nginx.org/en/docs/)
* code of the web app stored in Github repository

### Instructions

If you don't have *curl* installed, run
<br />
`sudo apt install curl`
<br /><br />
Download installation script using *curl*
<br />
`curl https://raw.githubusercontent.com/michalakadam/angular-build-deploy-tool/master/install.sh -o ./install_angular_build_deploy_tool.sh
`
<br /><br />
Make the installation script executable by running 
<br />
`chmod u+x ./install_angular_build_deploy_tool.sh`
<br /><br />
Run the installation script by typing 
<br />
`./install_angular_build_deploy_tool.sh`
<br /><br />
Fill all the required information when prompted by the installation script.
<br /> After successful installation, tool is ready. 
<br /> Now everytime you want to deploy commited and pushed changes to the remote server type (in source code directory) 
<br />
`./deploy.sh`
<br />
If everything goes well, you can see your local changes in the deployed webapp. 
<br />

#### deploy.sh flags
-nt, --no-tests <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;skip unit tests execution 

### Further reading

Check out my article on [hosting Angular web app on remote server](adam-michalak.site/how-to-host-angular-webapp-on-remote-server)
<br /><br />



**Do you have any problems with running this program?**
<br />
**Do you see any way this project can be improved?**
<br />
Don't hestitate to write an email to *adam.michalak.dev@gmail.com*
