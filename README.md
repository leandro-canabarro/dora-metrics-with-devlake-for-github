# 🚀 Apache DevLake + GitHub Codespaces

Este repositório oferece uma configuração pronta de Apache DevLake com Grafana em um ambiente GitHub Codespaces, permitindo que você comece a analisar métricas de desenvolvimento de software em minutos.

## 📋 Índice
- [Sobre o Projeto](#-sobre-o-projeto)
  - [O que são métricas DORA?](#o-que-são-métricas-dora)
- [Pré-requisitos](#️-pré-requisitos)
- [Como Usar](#-como-usar)
- [Configurar DevLake](#️-configurar-devlake)
- [Visualizando Métricas](#-visualizando-métricas)
- [Desenvolvimento Local](#-desenvolvimento-local)
- [Solução de Problemas](#-solução-de-problemas)
- [Recursos Adicionais](#-recursos-adicionais)

## 🔍 Sobre o Projeto

Apache DevLake é uma plataforma de análise de dados que coleta, integra e analisa dados de ferramentas de desenvolvimento de software para gerar métricas DORA e outros insights. Este projeto automatiza a configuração do DevLake e Grafana em um ambiente Codespaces ou em sua máquina local.

### O que são métricas DORA?

As métricas DORA (DevOps Research and Assessment) são quatro indicadores-chave que ajudam a medir o desempenho de equipes de desenvolvimento:

1. **Lead Time for Changes**: Tempo médio entre o primeiro commit e a implantação em produção
2. **Deployment Frequency**: Frequência com que implantações são feitas em produção
3. **Change Failure Rate**: Percentual de implantações que resultam em falha
4. **Time to Restore**: Tempo médio para restaurar o serviço após uma falha

Este projeto configura um ambiente completo para coletar, analisar e visualizar essas métricas a partir de seus repositórios GitHub.

## ⚙️ Pré-requisitos

- Conta GitHub
- Acesso a GitHub Codespaces (disponível em todos os planos, incluindo o gratuito)
- Token de acesso pessoal do GitHub com permissões para leitura de repositórios

## 🚀 Como Usar

1. Antes de começar, configure o arquivo `.env` na raiz do projeto:
   ```
   GITHUB_TOKEN=seu_token_github_aqui
   GRAFANA_API_TOKEN=eyJrIjoiYWRtaW4iLCJuIjoiYWRtaW4iLCJpZCI6MX0=
   ```

2. Clique no botão verde "Code" no topo deste repositório
3. Selecione a aba "Codespaces" e clique em "Create codespace on main"
4. Aguarde a inicialização (aproximadamente 3-5 minutos)
   - O ambiente está configurando o DevLake e Grafana via docker-compose automaticamente
5. Quando pronto, acesse:
   - DevLake UI: http://localhost:8080
   - DevLake Config UI: http://localhost:4000
   - Grafana: http://localhost:3002

## ⚙️ Configurar DevLake

### Configuração Manual

Para configurar o DevLake manualmente:

1. Acesse a interface do DevLake em http://localhost:8080
2. Crie uma conexão com o GitHub:
   - Vá para "Connections" e selecione "GitHub"
   - Adicione seu token de acesso pessoal do GitHub (instruções: [como criar um token](https://docs.github.com/pt/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token))

3. Configure os plugins desejados:
   - GitHub: para métricas de código, PRs e issues
   - Jenkins/GitLab/Jira: para integração com CI/CD e gerenciamento de projetos

4. Execute a coleta de dados:
   - Selecione os repositórios para análise
   - Configure o intervalo de datas
   - Inicie a coleta

## 📊 Visualizando Métricas

Após a configuração e coleta de dados, você pode visualizar as métricas DORA no Grafana:

1. Acesse o Grafana em http://localhost:3002
   - Usuário padrão: `admin`
   - Senha padrão: `admin`

2. Navegue até o dashboard "DORA Metrics Overview"
   - Este dashboard inclui visualizações das quatro métricas DORA principais:
     - Lead Time for Changes (tempo de entrega)
     - Deployment Frequency (frequência de implantação)
     - Change Failure Rate (taxa de falha de mudanças)
     - Time to Restore (tempo para restauração)

3. O dashboard é atualizado automaticamente à medida que o DevLake coleta novos dados

## 🔧 Desenvolvimento Local

Este projeto pode ser executado de duas formas:

### Opção 1: Dev Container (Recomendado)

Se você tem o VS Code com a extensão Dev Containers instalada:

1. Clone este repositório:
   ```bash
   git clone https://github.com/leandro-canabarro/dora-metrics-with-devlake-for-github.git
   cd dora-metrics-with-devlake-for-github
   ```

2. Configure o arquivo `.env` com seu token do GitHub:
   ```
   GITHUB_TOKEN=seu_token_github_aqui
   GRAFANA_API_TOKEN=eyJrIjoiYWRtaW4iLCJuIjoiYWRtaW4iLCJpZCI6MX0=
   ```

3. Abra no VS Code com Dev Container:
   - Abra o projeto no VS Code
   - Clique no ícone do Remote Containers no canto inferior esquerdo
   - Selecione "Reopen in Container"
   - O DevContainer irá automaticamente iniciar o Docker Compose com todos os serviços

### Opção 2: Docker Compose Direto

Para executar diretamente com Docker Compose:

1. Clone este repositório:
   ```bash
   git clone https://github.com/leandro-canabarro/dora-metrics-with-devlake-for-github.git
   cd dora-metrics-with-devlake-for-github
   ```

2. Configure o arquivo `.env` com seu token do GitHub:
   ```
   GITHUB_TOKEN=seu_token_github_aqui
   GRAFANA_API_TOKEN=eyJrIjoiYWRtaW4iLCJuIjoiYWRtaW4iLCJpZCI6MX0=
   ```

3. Inicie os serviços:
   ```bash
   docker compose up -d
   ```

### Acesso às Interfaces

Independente da opção escolhida, acesse:
- **DevLake UI**: http://localhost:8080 - Interface principal para configuração
- **DevLake Config UI**: http://localhost:4000 - Interface de configuração simplificada  
- **Grafana**: http://localhost:3002 - Dashboards e visualizações (admin/admin)
- **MySQL**: localhost:3306 - Banco de dados (usuário: merico, senha: merico)

## �🔧 Solução de Problemas

- **Portas não acessíveis**: Verifique se as portas estão encaminhadas corretamente no Codespaces (Painel inferior > PORTS)
- **Falha na inicialização**: Verifique os logs do docker compose executando `docker compose logs` no terminal
- **Token do GitHub não configurado**: Certifique-se de adicionar um token válido no arquivo `.env`
- **Serviços não iniciam**: Verifique logs específicos com `docker compose logs devlake` ou `docker compose logs grafana`
- **Dashboard não aparece no Grafana**: Verifique se o datasource MySQL está configurado corretamente

## 📚 Recursos Adicionais

- [Documentação oficial do Apache DevLake](https://devlake.apache.org/docs/)
- [Guia de métricas DORA](https://cloud.google.com/blog/products/devops-sre/using-the-four-keys-to-measure-your-devops-performance)
- [GitHub Codespaces docs](https://docs.github.com/pt/codespaces)
- [Como criar um token do GitHub](https://docs.github.com/pt/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
- [Documentação dos dashboards DORA](https://devlake.apache.org/docs/Dashboards/DORA)
