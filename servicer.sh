#primeiro ele deve verificar se existe o contêiner com o nome fornecido.
#
#se não ele vai criar a partir de uma imagem existente
#
#a outra função ele cria a partir da Dockerfile
#
#uma função para iniciar o serviço e a parti daqui ira checar se tem o serviço do contêiner
#
#uma função para parar e outra para excluir
#
#e uma função para rodar
#
#
#
#

#!/bin/bash

NOME_CONTÊINER=$1
IMAGEM=$2

verificar_conteiner() {
    if [ "$(docker ps -aq -f name=$NOME_CONTÊINER)" ]; then
        echo "O contêiner $NOME_CONTÊINER já existe."
    else
        echo "Criando o contêiner $NOME_CONTÊINER a partir da imagem $IMAGEM."
        docker run -d --name $NOME_CONTÊINER $IMAGEM
    fi
}

criar_conteiner_dockerfile() {
    echo "Criando o contêiner $NOME_CONTÊINER a partir do Dockerfile."
    docker build -t $NOME_CONTÊINER .
}

iniciar_servico() {
    echo "Iniciando o serviço do contêiner $NOME_CONTÊINER."
    docker start $NOME_CONTÊINER
}

checar_servico() {
    if [ "$(docker ps -q -f name=$NOME_CONTÊINER)" ]; then
        echo "O serviço do contêiner $NOME_CONTÊINER está em execução."
    else
        echo "O serviço do contêiner $NOME_CONTÊINER não está em execução."
    fi
}

parar_servico() {
    echo "Parando o serviço do contêiner $NOME_CONTÊINER."
    docker stop $NOME_CONTÊINER
}

excluir_conteiner() {
    echo "Excluindo o contêiner $NOME_CONTÊINER."
    docker rm $NOME_CONTÊINER
}

rodar_conteiner() {
    echo "Rodando o contêiner $NOME_CONTÊINER."
    docker run -d --name $NOME_CONTÊINER $IMAGEM
}