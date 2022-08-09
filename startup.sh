 #!/bin/bash

sudo echo "export PS1=\"\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\\$\[\e[m\] \" " > .bashrc  
sudo . .bashrc


sudo yum update -y
sudo yum install -y git


#var="$(curl http://checkip.amazonaws.com)"

#sudo sed -i "s/localhost/$var/g" /home/ec2-user/Full-Text-Search-App-ES/public/app.js

# docker-compose up -d --build
# docker exec gs-api "node" "server/load_data.js"


