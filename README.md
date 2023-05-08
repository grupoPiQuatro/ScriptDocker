# ScriptDocker
##Script para criação de containers<br>
Este script cria um container em mysql com as tabelas que podem ser ajustadas no script da pasta <b>mysql-script.<br><br>

### Comandos uteis
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
