#!/bin/bash

# Install any updates pending for the AMI
sudo yum update -y

# Download and Install Amazon Corretto 17
sudo yum install java-17-amazon-corretto-headless -y

# Download Minecraft Server JAR
wget $1

# Create eula.txt
echo "eula=true" > eula.txt

# Create run.sh
echo -e "#!/bin/bash\njava -Xmx1024M -Xms1024M -jar server.jar nogui" > run.sh
chmod +x run.sh
