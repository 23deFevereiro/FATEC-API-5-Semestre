<span id="23-de-fevereiro">
<img width="1800" height="526" alt="image" src="https://github.com/user-attachments/assets/9c2f315d-9621-4fed-be78-2aaac163f5b7" />

<p align="center">
    <a href="#introduction">Introduction</a> |
    <a href="#challenge">Challenge</a> |  
    <a href="#solution">Solution</a> |   
    <a href="#product-backlog">Product Backlog</a> |
    <a href="#project-evolution-timeline">Project Evolution Timeline</a> |
    <a href="#sprint-timeline">Sprint Timeline</a> |
    <a href="#technologies">Technologies</a> |
    <a href="#project-structure">Project Structure</a> |
    <a href="#run-use-and-test-the-project">Run, Use and Test the Project</a> |
    <a href="#documentation">Documentation</a> |
    <a href="#team">Team</a>
</p>

<span id="introduction">
    
## 📍 Introduction
This project was developed by the **23 de fevereiro** group, composed of students from the 5th semester of the `Banco de Dados` course at Fatec São José dos Campos.

The goal is to create `Lunae`, an extraction, data processing, and analytical visualization tool integrated with the databases of the partner company SIATT, focused on creating dashboards from the information the company possesses. Lunae will enable managers to perform historical and strategic analyses, generating relevant indicators for program and project management.

### SIATT: The Client Company
This project is a solution designed for SIATT – **Sistemas Integrados de Alto Teor Tecnológico (High Technology Integrated Systems)**, a Brazilian company founded in 2015 and headquartered in the São José dos Campos Technology Park (SP). Specializing in the development and integration of high-tech systems for the defense and aerospace sectors, the company focuses on creating advanced solutions such as missiles and smart weapons, guidance and navigation systems, radars, avionics, and communication and control systems. With a team predominantly composed of engineers and specialists, SIATT participates in strategic projects for the Brazilian Armed Forces, including the development of MANSUP (National Anti-Ship Missile), in addition to collaborating on technological initiatives focused on security, monitoring, and communication in complex environments.

---

<span id="challenge">

## 🧩 Challenge

<details>

<summary>Click here</summary>
<br>
The company develops strategic projects organized into institutional programs, involving engineering activities, material acquisition, and specialized technical task execution.
<br>
<br>
Currently, information related to purchase requests, orders, material commitments, inventory control, development tasks, and hours worked are distributed across different tables and systems, lacking a consolidated analytical view. <br> <br> The absence of data integration hinders the analysis of the actual cost of projects, comparison between programs, and the tracking of material consumption and technical hours over time. Project managers and those responsible for financial monitoring face difficulties in answering questions such as: how much did each project consume in materials? What is the total cost of technical hours? What is the actual cost of the product considering materials and development effort?
<br>
<br>
The challenge lies in designing and implementing an analytical environment capable of integrating information from project, procurement, and development areas, structuring the data appropriately to support historical and strategic analyses. The solution should allow multidimensional exploration of information, enabling the generation of relevant indicators for program and project management.
<br>
<br>
The detailing of business rules, definition of metrics, consolidation criteria, and prioritization of analyses must be built by the students together with the partner throughout the project, through interactions via Slack, following the incremental approach of the adopted agile methodology.

</details>

→ <a href="#23-de-fevereiro">Back to top</a>

---

<span id="solution">

## 🏅 Solution

<details>

<summary>Click here</summary>
<br>
Lunae is an analytical platform that integrates data from tasks, projects, programs, purchases, and hours worked, consolidating information that is currently scattered across different systems and tables. Through the import of CSV files provided by the partner, the data is processed, treated, and stored in a structured database, enabling precise analytical queries.
<br>
<br>
The solution provides an interactive dashboard with bar and line charts that allow managers to track resource consumption, cost evolution, and technical effort by project and program, as well as apply filters to explore different scenarios. With this, Lunae offers a consolidated and multidimensional view, supporting decision-making and strategic management of the company's institutional programs.

</details>

→ <a href="#23-de-fevereiro">Back to top</a>

---

<span id="product-backlog">

## 📋 Product Backlog

| Rank | Priority | User Story | Story Points | Sprint | Client Requirement | DoR |
|------|----------|------------|--------------|--------|-------------------|-----|
| 1 | 🔴 High | As a project manager, I want to view a bar chart of hours worked per employee to understand the team's effort distribution, separated by project | 8 | 1 | [RC05](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RC07](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais) | [Card](https://github.com/users/23deFevereiro/projects/1/views/1?pane=issue&itemId=165341438&issue=23deFevereiro%7CFATEC-API-5-Semestre%7C7) |
| 2 | 🔴 High | As a manager, I want to filter a specific project and view summary indicators like total cost and total time to quickly understand its overall status | 3 | 1 | [RC11](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[RC12](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais) | [Card](https://github.com/users/23deFevereiro/projects/1/views/1?pane=issue&itemId=165348614&issue=23deFevereiro%7CFATEC-API-5-Semestre%7C10) [Card](https://github.com/users/23deFevereiro/projects/1/views/1?pane=issue&itemId=167578002&issue=23deFevereiro%7CFATEC-API-5-Semestre%7C25) |
| 3 | 🔴 High | As a manager, I want to view the evolution of hours worked per project over time in a multi-line chart to track activity progress | 8 | 1 | [RC05](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[08](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais) | [Card](https://github.com/users/23deFevereiro/projects/1/views/1?pane=issue&itemId=165347588&issue=23deFevereiro%7CFATEC-API-5-Semestre%7C8) |
| 4 | 🔴 High | As a manager, I want to view the evolution of costs per project over time in a multi-line chart to track spending growth | 8 | 1 | [CR06](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[CR09](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais) | [Card](https://github.com/users/23deFevereiro/projects/1/views/1?pane=issue&itemId=165347776&issue=23deFevereiro%7CFATEC-API-5-Semestre%7C9) |
| 5 | 🔴 High | As a manager, I want to view the cost invested in each material through a materials table to assess the financial impact of projects | 3 | 1 | [CR06](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais) | [Card](https://github.com/users/23deFevereiro/projects/1/views/1?pane=issue&itemId=165350150&issue=23deFevereiro%7CFATEC-API-5-Semestre%7C13) |
| 6 | 🔴 High | As a manager, I want to view a table of employees with the total hours they have worked and the projects they are allocated to, so that I can understand resource distribution and team effort across projects | 3 | 1 | [CR07](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais) | [Card](https://github.com/users/23deFevereiro/projects/1/views/1?pane=issue&itemId=165350061&issue=23deFevereiro%7CFATEC-API-5-Semestre%7C12) |
| 7 | 🟡 Medium | As a manager, I want to view the evolution of hours worked per program over time to track aggregate effort at a strategic level | 8 | 2 | [CR05](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[CR10](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais) | [Card](https://github.com/users/23deFevereiro/projects/1/views/1?pane=issue&itemId=167289270&issue=23deFevereiro%7CFATEC-API-5-Semestre%7C18) |
| 8 | 🟡 Medium | As a manager, I want to view the evolution of costs per program over time to analyze the financial behavior of programs | 8 | 2 | [CR06](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[CR10](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais) | [Card](https://github.com/users/23deFevereiro/projects/1/views/1?pane=issue&itemId=167294467&issue=23deFevereiro%7CFATEC-API-5-Semestre%7C19) |
| 9 | 🟡 Medium | As a manager, I want to filter a specific program and view summary indicators such as estimated cost, actual cost, estimated hours, actual hours, and total number of projects in the program to quickly understand its overall status | 5 | 2 | [CR06](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[CR10](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[CR12](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais) | [Card](https://github.com/users/23deFevereiro/projects/1/views/1?pane=issue&itemId=167642161&issue=23deFevereiro%7CFATEC-API-5-Semestre%7C22) |
| 10 | 🟡 Medium | As a manager, I want to view the distribution of project statuses for a program in a donut chart to quickly understand the progress of initiatives | 5 | 2 | [CR05](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[CR06](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[CR10](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais) | [Card](https://github.com/users/23deFevereiro/projects/1/views/1?pane=issue&itemId=167643118&issue=23deFevereiro%7CFATEC-API-5-Semestre%7C24) |
| 11 | 🟡 Medium | As a manager, I want to view a table of projects with hour deviations containing information such as estimated hours, actual hours, task progress, and deviation to identify projects that need attention | 8 | 2 | [CR05](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[CR11](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[CR12](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais) | [Card](https://github.com/users/23deFevereiro/projects/1/views/1?pane=issue&itemId=167641774&issue=23deFevereiro%7CFATEC-API-5-Semestre%7C26) |
| 12 | 🟡 Medium | As a manager, I want to view a bar chart of hours worked per program to compare effort across different projects | 5 | 3 | [CR05](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[CR10](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[CR12](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais) | [Card](https://github.com/users/23deFevereiro/projects/1/views/1?pane=issue&itemId=167642965&issue=23deFevereiro%7CFATEC-API-5-Semestre%7C23) |
| 13 | 🟡 Medium | As a manager, I want to identify materials with insufficient stock through alert cards showing the most critical materials for project execution to anticipate the need for new purchases | 5 | 3 | [CR11](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais) | [Card](https://github.com/23deFevereiro/FATEC-API-5-Semestre/issues/27) |
| 14 | 🟡 Medium | As a manager, I want to view the deadline for placing a purchase request based on projected consumption and material lead time to avoid project delays | 5 | 3 | [CR06](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[CR11](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais) | [Card](https://github.com/23deFevereiro/FATEC-API-5-Semestre/issues/29) |
| 15 | 🟡 Medium | As a manager, I want to view material consumption per project over time in a depletion chart to understand how physical resources are used in projects | 8 | 3 | [CR06](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais)/[CR11](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/3.-Documenta%C3%A7%C3%A3o-de-Produto#requisitos-funcionais) | [Card](https://github.com/users/23deFevereiro/projects/1/views/1?pane=issue&itemId=167643711&issue=23deFevereiro%7CFATEC-API-5-Semestre%7C34) |
| 16 | 🟢 Low | As a user, I want to log into the system and have access only to the functionalities and views allowed by my profile (Super Admin, Financeiro, Compras, Almoxarifado, Projetos), so that each role sees only what is relevant to their area | 8 | 3 | --- | [Card](https://github.com/users/23deFevereiro/projects/1/views/1?pane=issue&itemId=167641048&issue=23deFevereiro%7CFATEC-API-5-Semestre%7C39) |

→ <a href="#23-de-fevereiro">Back to top</a>

---

<span id="project-evolution-timeline">
    
## ⏱️ Project Evolution Timeline

| Etapa            | Kick-Off | Sprint 1 | Sprint 2 | Sprint 3 |
| ---------------- | -------- | -------- | -------- | -------- |
| Planning         | ████████ | ████████ | ████████ | ██       |
| DW Modeling      | ████████ | ████████ | ██       |          |
| Backend (Django) |          | ████████ | ████████ | ██████   |
| Frontend (Vue)   |          | ████████ | ████████ | ██████   |
| Dashboards       |          | ████████ | ████████ | ██████   |
| Testing          |          | ████████ | ████████ | ██████   |

→ <a href="#23-de-fevereiro">Back to top</a>

---

<span id="sprint-timeline">
    
## 📅 Sprint Timeline

| Sprint | Start | End | History | Delivery |
|-|-|-|-|-|
| Kick off | 02/03/2026 | 15/03/2026 | --- | --- |
| SPRINT 1 | 16/03/2026 | 05/04/2026 | [Sprint 1 Docs](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/4.-Documenta%C3%A7%C3%A3o-das-Sprints#sprint-1-16032026--05042026) | [Vídeo](https://drive.google.com/file/d/1FBZCVFJgxZreMkHBh-Y0z6qCkJ1rsE-D/view?usp=sharing) |
| SPRINT 2 | 13/04/2026 | 03/05/2026 | [Sprint 2 Docs](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/4.-Documenta%C3%A7%C3%A3o-das-Sprints#sprint-2-13042026--03052026) | [Vídeo](https://drive.google.com/file/d/1KpWM7Ci-GUKqf7laThVxWOKwoQasUOW-/view?usp=sharing) |
| SPRINT 3 | 11/05/2026 | 31/05/2026 | [Sprint 3 Docs](https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki/4.-Documenta%C3%A7%C3%A3o-das-Sprints#sprint-3-11052026--31052026) | [Vídeo - TODO]() |
| Solutions Fair | 11/06/2026 | --- | --- | --- |

→ <a href="#23-de-fevereiro">Back to top</a>

---

<span id="technologies">

## 💻 Technologies

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

→ <a href="#23-de-fevereiro">Back to top</a>

---

<span id="project-structure">
    
## 🗂️ Project Structure

TODO (Sprint 3)

→ <a href="#23-de-fevereiro">Back to top</a>

---

<span id="run-use-and-test-the-project">
    
## 🚀 Run, Use and Test the Project

TODO (Sprint 3)

→ <a href="#23-de-fevereiro">Back to top</a>

---

<span id="documentation">

## 📚 Documentation

<a href="https://www.figma.com/design/UGtbRBRk3JZqQ7Vx9TMAQ8/API-5-Sem?node-id=0-1&p=f&t=2RMKV3keLHuhPPgL-0">Wireframe</a>

<a href="https://github.com/23deFevereiro/FATEC-API-5-Semestre/wiki">Documentation</a>

→ <a href="#23-de-fevereiro">Back to top</a>

---

<span id="team">

## :busts_in_silhouette: Team

<div align="center">

| Name | Role | Networking | Identification |
|---|---|---|---|
| Augusto Piatto | Product Owner | [![Linkedin](https://img.shields.io/badge/Linkedin-blue?logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/augusto-piatto/) [![GitHub](https://img.shields.io/badge/GitHub-111217?logo=github&logoColor=white)](https://github.com/augustopiatto) | <img src="./assets/Foto - Augusto.jpeg" width="60"> |
| Davi Soares | Scrum Master | [![Linkedin](https://img.shields.io/badge/Linkedin-blue?logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/dsf21/) [![Github](https://img.shields.io/badge/GitHub-111217?logo=github&logoColor=white)](https://github.com/DaviSFS21) | <img src="./assets/Foto - Davi.jpeg" width="60"> |
| João Bispo | Dev Team | [![Linkedin](https://img.shields.io/badge/Linkedin-blue?logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/jo%C3%A3o-pedro-563369181/) [![Github](https://img.shields.io/badge/GitHub-111217?logo=github&logoColor=white)](https://github.com/BispoJPM) | <img src="./assets/Foto - Joao.jpeg" width="60"> |
| Matheus Marciano | Dev Team | [![Linkedin](https://img.shields.io/badge/Linkedin-blue?logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/matheus-marciano-leite/) [![Github](https://img.shields.io/badge/GitHub-111217?logo=github&logoColor=white)](https://github.com/marcyleite) | <img src="./assets/Foto - Matheus.jpeg" width="60"> |
| Tiago Alberto | Dev Team | [![Linkedin](https://img.shields.io/badge/Linkedin-blue?logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/tiago-alberto-303909167/) [![Github](https://img.shields.io/badge/GitHub-111217?logo=github&logoColor=white)](https://github.com/Tiago17santos) | <img src="./assets/Foto - Tiago A.jpeg" width="60"> |
| Tiago Torres | Dev Team | [![Linkedin](https://img.shields.io/badge/Linkedin-blue?logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/tiago-torres-dos-reis/) [![Github](https://img.shields.io/badge/GitHub-111217?logo=github&logoColor=white)](https://github.com/TiagoTReis) | <img src="./assets/Foto - Tiago R.jpeg" width="60"> |

</div>

→ <a href="#23-de-fevereiro">Back to top</a>
