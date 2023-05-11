#!/bin/bash

echo verificando se o docker está instalado...
docker --version
if  [ $? -eq 0 ]
then
        docker compose version
        if [ $? -eq 0 ]
	then
                sudo docker ps | grep containerBD
                if [ $? -eq 0 ]
                then
			sleep 2
                        echo container banco de dados já iniciado
                else
	                sudo gpasswd -a $USER docker
                        newgrp docker
                        git clone https://github.com/grupoPiQuatro/ScriptDocker.git
                        cd ScriptDocker
                        echo iniciando banco de dados...
                        sleep 2
                        sudo docker compose up -d
                        echo container do banco iniciado!!
                        sleep 2
                        echo tabelas criadas
                        cd ..
		fi
        else
	    echo instalando docker compose...
    	    sleep 2
            sudo gpasswd -a $USER docker
            newgrp docker
    	    sudo apt-get update
	    sudo apt-get install ca-certificates curl gnupg
	    sudo apt-get install docker-compose-plugin
	    DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
	    sudo mkdir -p $DOCKER_CONFIG/cli-plugins
	    sudo curl -SL https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
	    sudo chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
	    sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
	    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	    echo docker compose instalado
	    sudo docker compose version
            sleep 2
            echo iniciando banco de dados...
            sleep 2
            sudo docker compose up -d
            echo container do banco iniciado!!
            sleep 2
            echo tabelas criadas
            cd ..
	fi
else
        echo instalando o docker...
	sleep 2
        sudo gpasswd -a $USER docker
        newgrp docker
        sudo apt install docker.io -y
	sleep 2
	echo docker instalado consucesso!!
    	echo instalando docker compose...
    	sleep 2
        sudo apt-get update
        sudo apt-get install ca-certificates curl gnupg
        sudo apt-get install docker-compose-plugin
        DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
        sudo mkdir -p $DOCKER_CONFIG/cli-plugins
        sudo curl -SL https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
        sudo chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
        sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    	echo docker compose instalado
    	sudo docker compose version
        echo iniciando banco de dados...
        sleep 2
        sudo docker compose up -d
        echo container do banco iniciado!!
        sleep 2
        echo tabelas criadas
        cd ..
fi
