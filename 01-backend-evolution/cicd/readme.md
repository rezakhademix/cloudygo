# these are all files of  CI/CD part of webinar
* all files and related code snippets are here!

# ssh to server
ssh reza@x.x.x.x

# install gitlab runner on server
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash

sudo apt-get install gitlab-runner
systemctl status gitlab-runner

# head to gitlab.com or your standalone gitlab
 Go to Settings > CI/CD > Runners
 Define a New project runner
 Copy registration token, We need it later!

# head back to server and make runner available by using below command
sudo gitlab-runner register -n --url https://gitlab.com --registration-token xxx --executor docker --description "Deployment Runner" --docker-image "docker:stable" --tag-list deployment --docker-privileged

# add deployer user 
sudo adduser deployer

# add user to docker group
sudo usermod -aG docker deployer
su deployer

# create a ssh key for deployer user to login
ssh-keygen -b 4096
cat ~/.ssh/id_rsaxxx.pub >> ~/.ssh/authorized_keys

# save the result of to use on gitlab
cat ~/.ssh/id_rsa

-----BEGIN RSA PRIVATE KEY-----
xxx
-----END RSA PRIVATE KEY-----

# head to gitlab.com or your standalone gitlab
# define these variables by going through left menu

Go to Settings > CI / CD > Variables

    Key: ID_RSA
    Value: SSH Key id_rsa.
    Type: File
    Environment Scope: All 
    Protect variable: true
    Mask variable: false

    Key: SERVER_IP
    Value: server_IP
    Type: Variable
    Environment scope: All 
    Protect variable: true
    Mask variable: true

    Key: SERVER_USER
    Value: deployer
    Type: Variable
    Environment scope: All 
    Protect variable: Checked
    Mask variable: Checked
