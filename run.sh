#!/bin/bash

echo verificando se o docker está instalado...
docker --version
if  [ $? -eq 0 ]
then
        docker compose version
        if [ $? -eq 0 ]
	then
            echo iniciando banco de dados...
            sleep 2
            docker compose up -d
            echo container do banco iniciado!!
            sleep 2
            echo tabelas criadas
        else
            echo instalando docker compose...
            sleep 2
            sudo apt-get update
	    sudo apt-get install docker-compose-plugin
	    sudo yum update
	    sudo yum install docker-compose-plugin
	    echo docker compose instalado
	    docker compose version
            sleep 2
            echo iniciando banco de dados...
            sleep 2
            docker compose up -d
            echo container do banco iniciado!!
            sleep 2
            echo tabelas criadas
	fi
else
        echo instalando o docker...
	sleep 2
        sudo apt install docker.io
	sleep 2
	echo docker instalado consucesso!!
	sudo gpasswd -a $USER docker
	newgrp docker

	echo instalando docker compose...
	sleep 2
    	echo instalando docker compose...
    	sleep 2
    	sudo apt-get update
    	sudo apt-get install docker-compose-plugin
    	sudo yum update
    	sudo yum install docker-compose-plugin
    	echo docker compose instalado
    	docker compose version

        echo iniciando banco de dados...
        sleep 2
        docker compose up -d
        echo container do banco iniciado!!
        sleep 2
        echo tabelas criadas
fi
