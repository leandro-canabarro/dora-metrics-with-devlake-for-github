FROM ubuntu:22.04

# Instalação básica
RUN apt-get update && apt-get install -y \
    curl git docker-compose mysql-client jq \
    && apt-get clean

# Instalação do Node.js e Yarn
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && npm install -g yarn

# Copia os scripts e recursos
COPY ./scripts /scripts
COPY ./branding/grafana/provisioning /etc/grafana/provisioning
COPY ./branding/grafana/custom.ini /etc/grafana/grafana.ini
RUN chmod +x /scripts/*.sh
