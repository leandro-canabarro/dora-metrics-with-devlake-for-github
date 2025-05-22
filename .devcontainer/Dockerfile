FROM mcr.microsoft.com/devcontainers/base:ubuntu

RUN apt-get update && apt-get install -y \
    curl \
    git \
    docker.io \
    docker-compose \
    && apt-get clean

RUN usermod -aG docker codespace

CMD ["sleep", "infinity"]