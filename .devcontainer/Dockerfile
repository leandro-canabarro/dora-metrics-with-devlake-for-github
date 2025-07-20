FROM ubuntu:22.04

# Instalação básica
RUN apt-get update && apt-get install -y \
    curl git docker-compose mysql-client jq \
    && apt-get clean

# Instalação do Node.js e Yarn
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | sudo bash - && \
    sudo apt-get install -y nodejs && npm install -g yarn
