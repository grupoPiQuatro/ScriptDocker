#!/bin/bash

echo verificando se o docker está instalado...
docker --version
if  [ $? -eq 0 ]
	then
        docker compose version
        if [ $? -eq 0 ]
            echo iniciando banco de dados...
            sleep 2
            docker compose up -d
            echo container do banco iniciado!!
            sleep 2
            echo tabelas criadas
        else
            echo instalando docker compose...
            sleep 2
            echo criando repositorio local docker...
            sleep 2
            sudo apt install ca-certificates curl gnupg lsb-release
            mkdir /etc/apt/demokeyrings
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/demokeyrings/demodocker.gpg
            echo \
            "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/demokeyrings/demodocker.gpg] https://download.docker.com/linux/ubuntu \
            $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
            sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
            sleep 2

            echo iniciando banco de dados...
            sleep 2
            docker compose up -d
            echo container do banco iniciado!!
            sleep 2
            echo tabelas criadas
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
		echo criando repositorio local docker...
		sleep 2
		sudo apt install ca-certificates curl gnupg lsb-release
		mkdir /etc/apt/demokeyrings
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/demokeyrings/demodocker.gpg
		echo \
  		"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/demokeyrings/demodocker.gpg] https://download.docker.com/linux/ubuntu \
  		$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
		sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
		sleep 2

        echo iniciando banco de dados...
        sleep 2
        docker compose up -d
        echo container do banco iniciado!!
        sleep 2
        echo tabelas criadas
fi
