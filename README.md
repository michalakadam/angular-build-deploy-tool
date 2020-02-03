# Tool for building and deploying Angular webapp on remote server

### Requirements
* access over ssh to remote server hosting webapp
* webapp already served using one of [web delivery tools](https://stackshare.io/stackups/apache-httpd-vs-jetty-vs-nginx)
* code of the webapp stored in Github repository

### Instructions

(optionally) Install *curl*
<br />
`sudo apt install curl`
<br /><br />
Download installation script using *curl*
<br />
`curl https://raw.githubusercontent.com/michalakadam/angular-build-deploy-tool/master/install.sh -o ~/install_angular_build_deploy_tool.sh
`
<br /><br />
Make the installation script executable by running 
<br />
`chmod u+x ~/install_angular_build_deploy_tool.sh`
<br /><br />
Run the installation script by typing 
<br />
`~/install_angular_build_deploy_tool.sh`
<br /><br />
Fill all the required information when prompted by the installation script.
<br /> The tool is ready. Now everytime you want to deploy commited changes to the remote server type 
<br />
`deploy`
<br />
If everything goes well, you can see your local changes in the deployed webapp. 
<br />

### Improvement ideas

* make it possible to work with multiple webpages
* add options of functionality customization, eg. changing git branch, deployment without running tests.
<br /><br />

### Further reading

Check out my article on [hosting Angular webapp on remote server](adam-michalak.site/how-to-host-angular-webapp-on-remote-server)
<br /><br />



**Do you have any problems with running this program?**
<br />
**Do you see any way this project can be improved?**
<br />
Don't hestitate to write an email to *adam.michalak.dev@gmail.com*
