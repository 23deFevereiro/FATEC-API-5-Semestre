# SonarCloud Setup

## Visão Geral

O SonarCloud foi integrado ao projeto para permitir a análise contínua de qualidade do código. A ferramenta monitora automaticamente bugs, vulnerabilidades e code smells nos repositórios do projeto.

## Organização

- **Organização no SonarCloud:** 23 de Fevereiro
- **Dashboard:** [sonarcloud.io/organizations/23defevereiro-1/projects](https://sonarcloud.io/organizations/23defevereiro-1/projects)

## Projetos Configurados

| Repositório | Projeto no SonarCloud |
|---|---|
| API_5_SEM_BACK | 23deFevereiro_API_5_SEM_BACK |
| API_5_SEM_FRONT | 23deFevereiro_API_5_SEM_FRONT |

## Como Funciona

A análise é disparada automaticamente em dois momentos:

- **Push na branch `main`:** toda vez que um commit for enviado para a branch principal
- **Pull Request:** toda vez que um PR for aberto, sincronizado ou reaberto

## Arquivos de Configuração

Cada repositório contém os seguintes arquivos:

- `.github/workflows/build.yml` — pipeline do GitHub Actions responsável por disparar a análise
- `sonar-project.properties` — arquivo de configuração do SonarCloud com a chave do projeto e organização

## Autenticação

A autenticação com o SonarCloud é feita via token armazenado como secret no GitHub:

- **Nome do secret:** `SONAR_TOKEN`
- O token é configurado em cada repositório separadamente em **Settings → Secrets and variables → Actions**
- Os tokens são específicos por projeto e não devem ser compartilhados ou expostos

## Métricas Monitoradas

| Métrica | Descrição |
|---|---|
| **Security** | Vulnerabilidades de segurança no código |
| **Reliability** | Bugs que podem causar comportamento inesperado |
| **Maintainability** | Code smells que dificultam a manutenção |
| **Duplications** | Trechos de código duplicados |
| **Hotspots** | Pontos sensíveis de segurança que precisam de revisão |

## Boas Práticas

- Verifique se a análise do SonarCloud passou antes de fazer merge de qualquer PR
- Priorize a correção de issues de **Security** e **Reliability** antes de avançar no desenvolvimento
- Em caso de necessidade de regenerar o token, acesse o SonarCloud e atualize o secret no GitHub correspondente
