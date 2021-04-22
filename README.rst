# Documentation for deploying this flask application with a database and creating a CI-CD pipeline for the process.




## Tools used

 - Ansible
 - Terraform
 - Google cloud platform
 - Nginx
 - Gunicorn
 - Postgresql

## Approach to the problem
I approached this task, carrying out all the steps manually at first. I got the application to run on my local system first before deploying. I deployed by creating a systemd service file for gunicorn application server, then setting up a reverse proxy for the server using nginx. The steps for configuring and deploying servers were automated using ansible and terraform.

## The files for the task are in the terraform_flask folder
 
 - Playbook.yml - This contains the ansible configuration file for the public server used to deploy the application.
 - ansible_config_for_db_server.yml - This contains the ansible configuration file for the private server for the database.
 
- vm,tf - This contains the terraform file for the vm resources
-  nginx _config_file- This the file containing the configuration file for  the folder sites-enabled in /etc/nginx.
- python_installation_script- this contains the script to install python
  
