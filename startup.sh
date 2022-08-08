 #!/bin/bash

sudo echo "export PS1=\"\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\\$\[\e[m\] \" " > .bashrc  
sudo . .bashrc

sudo yum update -y
sudo yum install java-11-amazon-corretto-headless -y
sudo update-alternatives --set java /usr/lib/jvm/java-11-amazon-corretto.x86_64/bin/java
sudo yum install -y git
sudo yum install -y wget

sudo yum -y install docker
sudo service docker start
sudo chmod 666 /var/run/docker.sock
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.6.2-x86_64.rpm
sudo rpm -i elasticsearch-7.6.2-x86_64.rpm

wget https://artifacts.elastic.co/downloads/logstash/logstash-7.6.2.rpm
sudo rpm -i logstash-7.6.2.rpm

wget https://artifacts.elastic.co/downloads/kibana/kibana-7.6.2-x86_64.rpm
sudo rpm -i kibana-7.6.2-x86_64.rpm

sudo sed -i 's/#server.host: "localhost"/server.host: "0.0.0.0"/g' /etc/kibana/kibana.yml
sudo sed -i 's/#server.port: 5601/server.port: 5601/g' /etc/kibana/kibana.yml
sudo sed -i 's/8-13:-XX:+UseConcMarkSweepGC/#8-13:-XX:+UseConcMarkSweepGC/g' /etc/elasticsearch/jvm.options

sudo -i service elasticsearch start
sudo -i service kibana start

git clone https://github.com/Nhaila-Abdessamad/Full-Text-Search-App-ES.git
sudo chmod -R ugo+rwx Full-Text-Search-App-ES

echo '#!/bin/bash' >> /tmp/ip.sh

echo 'var="$(curl http://checkip.amazonaws.com)"' >> /tmp/ip.sh

echo 'sudo sed -i "s/localhost/$var/g" /home/ec2-user/Full-Text-Search-App-ES/public/app.js' >> /tmp/ip.sh

sudo chmod +x /tmp/ip.sh

#var="$(curl http://checkip.amazonaws.com)"

#sudo sed -i "s/localhost/$var/g" /home/ec2-user/Full-Text-Search-App-ES/public/app.js

# docker-compose up -d --build
# docker exec gs-api "node" "server/load_data.js"


