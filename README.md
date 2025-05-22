# 🚀 Apache DevLake + GitHub Codespaces

Este repositório oferece uma configuração pronta de Apache DevLake com Grafana em um ambiente GitHub Codespaces, permitindo que você comece a analisar métricas de desenvolvimento de software em minutos.

## 📋 Índice
- [Sobre o Projeto](#sobre-o-projeto)
- [Pré-requisitos](#pré-requisitos)
- [Como Usar](#como-usar)
- [Configurar DevLake](#configurar-devlake)
- [Visualizando Métricas](#visualizando-métricas)
- [Solução de Problemas](#solução-de-problemas)
- [Recursos Adicionais](#recursos-adicionais)

## 🔍 Sobre o Projeto

Apache DevLake é uma plataforma de análise de dados que coleta, integra e analisa dados de ferramentas de desenvolvimento de software para gerar métricas DORA e outros insights. Este projeto automatiza a configuração do DevLake e Grafana em um ambiente Codespaces.

## ⚙️ Pré-requisitos

- Conta GitHub
- Acesso a GitHub Codespaces (disponível em todos os planos, incluindo o gratuito)

## 🚀 Como Usar

1. Clique no botão verde "Code" no topo deste repositório
2. Selecione a aba "Codespaces" e clique em "Create codespace on main"
3. Aguarde a inicialização (aproximadamente 3-5 minutos)
   - O ambiente está configurando o DevLake e Grafana via docker-compose
4. Quando pronto, acesse:
   - DevLake: http://localhost:4000
   - Grafana: http://localhost:3000

## ⚙️ Configurar DevLake

1. Crie uma conexão com o GitHub:
   - Na interface do DevLake, vá para "Connections" e selecione "GitHub"
   - Adicione seu token de acesso pessoal do GitHub (instruções: [como criar um token](https://docs.github.com/pt/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token))

2. Configure os plugins desejados:
   - GitHub: para métricas de código, PRs e issues
   - Jenkins/GitLab/Jira: para integração com CI/CD e gerenciamento de projetos

3. Execute a coleta de dados:
   - Selecione os repositórios para análise
   - Configure o intervalo de datas
   - Inicie a coleta

4. Visualize as métricas DORA no Grafana:
   - Acesse http://localhost:3000
   - Usuário padrão: `admin`
   - Senha padrão: `admin`
   - Navegue até os dashboards pré-configurados do DevLake

## 🔧 Solução de Problemas

- **Portas não acessíveis**: Verifique se as portas estão encaminhadas corretamente no Codespaces (Painel inferior > PORTS)
- **Falha na inicialização**: Verifique os logs do docker-compose executando `docker-compose logs` no terminal

## 📚 Recursos Adicionais

- [Documentação oficial do Apache DevLake](https://devlake.apache.org/docs/)
- [Guia de métricas DORA](https://cloud.google.com/blog/products/devops-sre/using-the-four-keys-to-measure-your-devops-performance)
- [GitHub Codespaces docs](https://docs.github.com/pt/codespaces)
