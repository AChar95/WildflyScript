sudo useradd --create-home wildfly
sudo usermod --shell /bin/bash wildfly

echo >> wildfly.service
echo "[Unit]" >> wildfly.service
echo "Description=Jenkins" >> wildfly.service
echo >> wildfly.service
echo "[Service]" >> wildfly.service
echo 'User=jenkins' >> wildfly.service
echo 'WorkingDirectory=/home/wildfly' >> wildfly.service
echo 'ExecStart=/home/wildfly-10.1.0.Final/bin/standalone -b=0.0.0.0' >> wildfly.service
echo >> wildfly.service
echo "[Install]" >> wildfly.service
echo 'WantedBy=multi-user.target' >> wildfly.service

sudo mv wildfly.service /etc/systemd/system/wildfly.service

sudo su - wildfly -c "wget https://download.jboss.org/wildfly/10.1.0.Final/wildfly-10.1.0.Final.tar.gz"
sudo su - wildfly -c "tar .xvf wildfly-10.1.0.Final.tar.gz"

sudo systemctl daemon-reload
sudo systemctl enable wildfly
sudo systemctl start wildfly
