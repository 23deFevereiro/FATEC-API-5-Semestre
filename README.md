<span id="23-de-fevereiro">
# TODO (imagem com nome do produto aqui)

<p align="center">
    <a href="#introducao">Introducao</a> |
    <a href="#desafio">Desafio</a> |  
    <a href="#solucao">Solução</a> |   
    <a href="#backlog-do-produto">Backlog do Produto</a> |
    <a href="#cronograma-de-evolucao">Cronograma de Evolução do Projeto</a> |
    <a href="#cronograma-de-sprints">Cronograma de Sprints</a> |
    <a href="#tecnologias">Tecnologias</a> |
    <a href="#executar-usar-testar-o-projeto">Executar, Usar e Testar o Projeto</a> |
    <a href="#estrutura-do-projeto">Estrutura do Projeto</a> |
    <a href="#documentacao">Documentação</a> |
    <a href="#equipe">Equipe</a>
</p>

<span id="introducao">
    
## 📍 Introdução
Este projeto foi desenvolvido pelo grupo **23 de fevereiro**, composto por estudantes do 5º semestre de Tecnologia em Banco de Dados da Fatec São José dos Campos.

A proposta é criar a `Lunae`, uma ferramenta de extração, tratativa de dados e visão analítica, integrada às base de dados da empresa parceira **SIATT**, com foco em criar dashboards das informações que a empresa dispõe. A Lunae permitirá que gestores façam análises históricas e estratégicas e, assim, gerar indicadores relevantes para a gestão de programas e projetos.

### SIATT: A Empresa Cliente
O projeto é uma solução voltada à SIATT – **Sistemas Integrados de Alto Teor Tecnológico**, empresa brasileira fundada em 2015 e sediada no Parque Tecnológico de São José dos Campos (SP). Especializada no desenvolvimento e integração de sistemas de alta tecnologia para os setores de defesa e aeroespacial, a companhia atua na criação de soluções avançadas como mísseis e armamentos inteligentes, sistemas de guiagem e navegação, radares, aviônicos e sistemas de comunicação e controle. Com uma equipe majoritariamente formada por engenheiros e especialistas, a SIATT participa de projetos estratégicos para as Forças Armadas brasileiras, incluindo o desenvolvimento do MANSUP (Míssil Antinavio Nacional), além de colaborar em iniciativas tecnológicas voltadas à segurança, monitoramento e comunicação em ambientes complexos.

---

<span id="desafio">

## 🧩 Desafio

<details>
     
<summary>Clique aqui</summary>
<br>
A empresa desenvolve projetos estratégicos organizados em programas institucionais, envolvendo atividades de engenharia, aquisição de materiais e execução de tarefas técnicas especializadas.
<br>
<br>
Atualmente, as informações relacionadas a solicitações de compra, pedidos, empenho de materiais, controle de estoque, tarefas de desenvolvimento e horas trabalhadas encontram-se distribuídas em diferentes tabelas e sistemas, sem uma visão analítica consolidada.
<br>
<br>
A ausência de integração entre os dados dificulta a análise do custo real dos projetos, a comparação entre programas e o acompanhamento do consumo de materiais e horas técnicas ao longo do tempo. Gestores de projeto e responsáveis pelo acompanhamento financeiro enfrentam dificuldades para responder questões como: quanto cada projeto consumiu em materiais? Qual o custo total de horas técnicas? Qual é o custo real do produto considerando materiais e esforço de desenvolvimento?
<br>
<br>
O desafio consiste em projetar e implementar um ambiente analítico capaz de integrar informações provenientes das áreas de projetos, aquisições e desenvolvimento, estruturando os dados de forma adequada para apoiar análises históricas e estratégicas. A solução deverá permitir a exploração multidimensional das informações, possibilitando a geração de indicadores relevantes para a gestão de programas e projetos.
<br>
<br>
O detalhamento das regras de negócio, definição de métricas, critérios de consolidação e priorização das análises deverá ser construído pelos alunos em conjunto com o parceiro ao longo do projeto, por meio das interações realizadas via Slack, seguindo a abordagem incremental prevista na metodologia ágil adotada.

</details>

<span id="solucao">

## 🏅 Solução

<details>

<summary>Clique aqui</summary>
<br>
A Lunae é uma plataforma analítica que integra dados de tarefas, projetos, programas, compras e horas trabalhadas, consolidando informações que atualmente estão dispersas em diferentes sistemas e tabelas. Por meio da importação de arquivos CSV fornecidos pelo parceiro, os dados são processados, tratados e armazenados em um banco de dados estruturado, permitindo consultas analíticas precisas.
<br>
<br>
A solução fornece um dashboard interativo com gráficos de barras e linhas que permitem aos gestores acompanhar o consumo de recursos, evolução de custos e esforço técnico por projeto e programa, além de aplicar filtros para explorar diferentes cenários. Com isso, a Lunae oferece uma visão consolidada e multidimensional, apoiando a tomada de decisão e a gestão estratégica dos programas institucionais da empresa.

</details>

→ <a href="#23-de-fevereiro">Voltar ao topo</a>

---

<span id="backlog-do-produto">

## 📋 Backlog do Produto

Rank | Prioridade | User Story | Story Points | Sprint | Requisito do Cliente
-- | -- | -- | -- | -- | --
1 | 🔴 Alta | Como gestor de projeto, quero visualizar um gráfico de barras com horas trabalhadas por funcionário para entender a distribuição de esforço da equipe separados por projeto | 8 | 1 | [RF05](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF07](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF12](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)
2 | 🔴 Alta | Como gestor, quero visualizar informações de cada projeto através da aplicação de filtro | 3 | 1 | [RF02](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF11](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF12](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)
3 | 🔴 Alta | Como gestor, quero visualizar a evolução de horas trabalhadas por projeto ao longo do tempo em um gráfico multi-linha para acompanhar o progresso das atividades | 8 | 1 | [RF05](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF08](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF12](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)
4 | 🔴 Alta | Como gestor, quero visualizar a evolução de custos por projeto ao longo do tempo em um gráfico multi-linha para acompanhar o crescimento dos gastos | 8 | 1 | [RF06](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF09](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF12](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)
5 | 🔴 Alta | Como gestor, quero calcular o custo total por projeto com base nas compras realizadas para avaliar o impacto financeiro dos projetos | 3 | 1 | [RF02](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF06](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF12](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)
6 | 🟡 Média | Como gestor, quero visualizar a evolução de horas trabalhadas por programa ao longo do tempo para acompanhar o esforço agregado em nível estratégico | - | 2 | [RF05](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF10](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF12](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)
7 | 🟡 Média | Como gestor, quero visualizar a evolução de custos por programa ao longo do tempo para analisar o comportamento financeiro dos programas | - | 2 |[RF06](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF10](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF12](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)
8 | 🟡 Média | Como gestor, quero visualizar um gráfico de barras com horas trabalhadas por programa para comparar o esforço entre diferentes programas | - | 2 | [RF05](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF10](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)
9 | 🟡 Média | Como gestor, quero consolidar horas e custos por programa para permitir análises estratégicas entre diferentes programas da organização | - | 2 | [RF05](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF06](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF10](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RF14](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)

→ <a href="#23-de-fevereiro">Voltar ao topo</a>

---

<span id="cronograma-de-evolucao">
    
## ⏱️ Cronograma de Evolução do Projeto

| Etapa            | Kick-Off | Sprint 1 | Sprint 2 | Sprint 3 |
| ---------------- | -------- | -------- | -------- | -------- |
| Planejamento     | ████████ | ████████ | ████     |          |
| Modelagem do DW  | ████████ | ██       |          |          |
| Backend (Django) |          | ████████ | ████████ | ████████ |
| Frontend (Vue)   |          | ████████ | ████████ | ████████ |
| Dashboards       |          | ████████ | ████████ | ████████ |
| Testes           |          | ████████ | ████████ | ████████ |

→ <a href="#23-de-fevereiro">Voltar ao topo</a>

---

<span id="cronograma-de-sprints">
    
## 📅 Cronograma de Sprints

| Sprint | Início | Fim | Histórico | Entrega |
|-|-|-|-|-|
| Kick off | 02/03/2026 | 15/03/2026 | --- | --- |
| SPRINT 1 | 16/03/2026 | 05/04/2026 | [Sprint 1 Docs](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/5.-Documenta%C3%A7%C3%A3o-das-Sprints#sprint-1) | [Vídeo - TODO]() |
| SPRINT 2 | 13/04/2026 | 03/05/2026 | [Sprint 2 Docs](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/5.-Documenta%C3%A7%C3%A3o-das-Sprints#sprint-2) | [Vídeo - TODO]() |
| SPRINT 3 | 11/05/2026 | 31/05/2026 | [Sprint 3 Docs](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/5.-Documenta%C3%A7%C3%A3o-das-Sprints#sprint-3) | [Vídeo - TODO]() |
| Feira de Soluções | 11/06/2026 | --- | --- | --- |

→ <a href="#23-de-fevereiro">Voltar ao topo</a>

---

<span id="tecnologias">

## 💻 Tecnologias

<p align="center">
  <img src="https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D" />
  <img src="https://img.shields.io/badge/django-%23092E20.svg?style=for-the-badge&logo=django&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white" />
  <img src="https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white" />
  <img src="https://img.shields.io/badge/VS_Code-CED4DA?style=for-the-badge&logo=visual-studio-code&logoColor=0078D4" />
  <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Swagger-85EA2D?style=for-the-badge&logo=swagger&logoColor=black" />
</p>

→ <a href="#23-de-fevereiro">Voltar ao topo</a>

---

<span id="executar-usar-testar-o-projeto">
    
## 🚀 Executar, Usar e Testar o Projeto

TODO

→ <a href="#23-de-fevereiro">Voltar ao topo</a>

---

<span id="estrutura-do-projeto">
    
## 🗂️ Estrutura do Projeto

TODO

→ <a href="#23-de-fevereiro">Voltar ao topo</a>

---

<span id="documentacao">

## 📚 Documentação

<a href="https://www.figma.com/design/UGtbRBRk3JZqQ7Vx9TMAQ8/API-5-Sem?node-id=0-1&p=f&t=2RMKV3keLHuhPPgL-0">Wireframe</a>

<a href="https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki">Documentação</a>

→ <a href="#23-de-fevereiro">Voltar ao topo</a>

---

<span id="equipe">

## :busts_in_silhouette: Equipe

<div align="center">

| Nome | Função | Networking | Identificação |
|---|---|---|---|
| Augusto Piatto | Product Owner | [![Linkedin](https://img.shields.io/badge/Linkedin-blue?logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/augusto-piatto/) [![GitHub](https://img.shields.io/badge/GitHub-111217?logo=github&logoColor=white)](https://github.com/augustopiatto) | <img src="https://media.licdn.com/dms/image/v2/D4D03AQHIufwtUAtP-g/profile-displayphoto-shrink_800_800/B4DZTbun62HAAg-/0/1738853220594?e=1774483200&v=beta&t=3HthESSDspBYXny1gmIWKqkbhdxXaLLZe_UnTdCidng" width="60"> |
| Davi Soares | Scrum Master | [![Linkedin](https://img.shields.io/badge/Linkedin-blue?logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/dsf21/) [![Github](https://img.shields.io/badge/GitHub-111217?logo=github&logoColor=white)](https://github.com/DaviSFS21) | <img src="https://media.licdn.com/dms/image/v2/D5603AQH4Mq-L9oCcvQ/profile-displayphoto-crop_800_800/B56ZlN660SIsAI-/0/1757948918646?e=1774483200&v=beta&t=LtvBfkP3zSOK9FI9lFlSDA6BNhOMU4pn0wfoAXT0taw" width="60"> |
| João Paulista | Dev Team | [![Linkedin](https://img.shields.io/badge/Linkedin-blue?logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/joaopaulista/) [![Github](https://img.shields.io/badge/GitHub-111217?logo=github&logoColor=white)](https://github.com/joaopaulista) | <img src="https://media.licdn.com/dms/image/v2/D4E03AQHC8f40eim1BA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1727891030117?e=1774483200&v=beta&t=lUqkcfaiVL7nnI_lQQv-LacAhXSHAnGYpSZAuWyGMvc" width="60"> |
| João Ventura | Dev Team | [![Linkedin](https://img.shields.io/badge/Linkedin-blue?logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/joão-pedro-ventura-51988a21b/) [![Github](https://img.shields.io/badge/GitHub-111217?logo=github&logoColor=white)](https://github.com/jauventur) | <img src="https://media.licdn.com/dms/image/v2/D4D03AQEyWGUnjpFoXw/profile-displayphoto-shrink_800_800/B4DZVYUR3sG4Ac-/0/1740943467142?e=1774483200&v=beta&t=C8fTzvieLo4sY47TwCb5v3i1Kt8jgn9WUKYdP2vfyBM" width="60"> |
| Matheus Marciano | Dev Team | [![Linkedin](https://img.shields.io/badge/Linkedin-blue?logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/matheus-marciano-leite/) [![Github](https://img.shields.io/badge/GitHub-111217?logo=github&logoColor=white)](https://github.com/marcyleite) | <img src="https://media.licdn.com/dms/image/v2/D4D03AQGpkZizsf7guQ/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1697472746080?e=1774483200&v=beta&t=fE97NHSmwVgyuFCQ8Ww81XJ7eXD4wLcttk3PWcW4CoM" width="60"> |
| Tiago Alberto | Dev Team | [![Linkedin](https://img.shields.io/badge/Linkedin-blue?logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/tiago-alberto-303909167/) [![Github](https://img.shields.io/badge/GitHub-111217?logo=github&logoColor=white)](https://github.com/Tiago17santos) | <img src="https://media.licdn.com/dms/image/v2/D4D03AQGueuuOSlgVKA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1719004996407?e=1774483200&v=beta&t=58jo0Tm7oeStLml2Ww5upJGJc7suChq6QjrFphHjabw" width="60"> |
| Tiago Torres | Dev Team | [![Linkedin](https://img.shields.io/badge/Linkedin-blue?logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/tiago-torres-dos-reis/) [![Github](https://img.shields.io/badge/GitHub-111217?logo=github&logoColor=white)](https://github.com/TiagoTReis) | <img src="https://media.licdn.com/dms/image/v2/D4D35AQHO-0RsXZghfw/profile-framedphoto-shrink_800_800/profile-framedphoto-shrink_800_800/0/1737581648985?e=1773601200&v=beta&t=Ho2cWDEntTd8jQ1kWM9KX4ioJSCADEat7pCHhtE6JLc" width="60"> |

</div>

→ <a href="#23-de-fevereiro">Voltar ao topo</a>

