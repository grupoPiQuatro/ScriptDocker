## __Essa branch deve ser utilizada apenas no projeto CLI__

# ScriptDocker
<h3>Script de autimatização de criação de containers</h3>
Este é um projeto de automação para instanciação de containers.<br>
Neste caso é criado um container com uma imagem <b>mysql 5.7</b>.<br>
As tabelas podem ser editadas no script da pasta <b>mysql-script/script.sql</b>.<br>

<h3>removeEnv.sh</h3>
  - executa codigos que deixam todos os containers executados em stop antes de removelos.<br>
<h3>run.sh</h3>
  - executa os comandos shell para instalação do <bold>docker</bold> e <bold>docker-compose</bold><br>
<h3>docker-compose.yml</h3>
  - sendo uma solução <bold>devops</bold>, os arquivos .yml instanciam containers de forma automatizada.<br>
    (é um arquivo muito sensivel, qualquer virgula pode quebrar a automação)

# Comandos uteis
Stop em todos os containers<br>
docker stop $(docker ps -a -q)<br><br>

Apagas todos os containers<br>
docker rm $(docker ps -a -q)<br><br>

Apagar todas as imagens<br>
docker rmi $(docker images -a -q)<br><br>

remover containers, imagens e networks<br>
docker system prune<br><br>

remover volumes<br>
docker system prune --all --force --volumes<br><br>

atualizar grupo (isso mata o script)<br>
newgrp group_name<br><br>

para ver os logs de um container<br>
sudo docker container logs --follow container_name
