<span id="23-de-fevereiro">
<img width="1800" height="526" alt="image" src="https://github.com/user-attachments/assets/9c2f315d-9621-4fed-be78-2aaac163f5b7" />

<p align="center">
    <a href="#introduction">Introduction</a> |
    <a href="#challenge">Challenge</a> |  
    <a href="#solution">Solution</a> |   
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

<details>

<summary>Click here</summary>

## 1. System Architecture

### 1.1 Data Flow Overview

```
CSVs (client) → ETL (Django commands) → PostgreSQL (star schema) → Django REST API → Vue.js Frontend
```

1. **Source:** The client provides CSV files containing data on projects, tasks, hours worked, materials, purchases, and inventory.
2. **ETL:** The `fix_csv` command corrects inconsistencies in the raw data (cascading statuses, conflicting assignees, etc.) and saves the corrected CSVs in `corrected_documents/`. The `dev_db` command then runs the seed matching the current migration, which reads those corrected CSVs and populates the database using the **star schema** (dimensions + facts).
3. **Database:** PostgreSQL stores dimension tables (`dim_*`) and fact tables (`fato_*`).
4. **API:** The Django REST Framework backend exposes endpoints under `/api/` that query the database via ORM and return JSON.
5. **Frontend:** The Vue.js SPA consumes these endpoints and renders dashboards with charts (ApexCharts), tables, and KPI cards.

---

### 1.2 Component Diagram

```
┌────────────────┐             ┌───────────────────────────┐             ┌──────────────────────┐
│  Client CSVs   │  raw files  │  ETL (Django mgmt)        │  clean data │  PostgreSQL          │
│  (CSV files)   │ ──────────▶ │  fix_csv  ──▶  dev_db     │ ──────────▶ │  dim_* + fato_*      │
└────────────────┘             └───────────────────────────┘             └──────────┬───────────┘
                                                                                    │
                                                                               ORM queries
                                                                                    │
                               ┌───────────────────────────┐             ┌──────────▼───────────┐
                               │  Frontend                 │  JSON/REST  │  Backend             │
                               │  Vue.js + ApexCharts      │ ◀────────── │  Django REST API     │
                               └───────────────────────────┘             └──────────────────────┘
```

---

### 1.3 Main API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/projetos/` | Lists all projects (filters: `search`, `programa_id`) |
| GET | `/api/projetos-overview` | General KPIs across all projects |
| GET | `/api/projetos/{id}/resumo/` | Summary of a specific project |
| GET | `/api/projetos/{id}/materiais/` | Materials used in a project (paginated, period and material filters) |
| GET | `/api/projetos/{id}/horas-por-funcionario/` | Hours per employee in a project (period filters) |
| GET | `/api/projetos/{id}/funcionarios/` | Employees allocated to a project |
| GET | `/api/projetos/burnup-horas/` | Hours burnup data per project (filter: `programa_id`) |
| GET | `/api/programas/` | Lists all programs (filter: `search`) |
| GET | `/api/programas/{id}/resumo/` | Summary of a program |
| GET | `/api/programas/{id}/distribuicao-status/` | Status distribution of projects within a program |
| GET | `/api/programas-burnup-horas/` | Hours burnup aggregated by program |
| GET | `/api/programas-burnup-custo/` | Cost burnup aggregated by program |
| GET | `/api/programas/{id}/tabela-projetos/` | Projects table for a program (paginated, sortable) |
| GET | `/api/programas/{id}/horas-por-projeto/` | Hours distributed per project within a program |
| GET | `/api/compras/materiais/` | Materials that have registered purchases |
| GET | `/api/compras/lead-time/?material_id={id}` | Lead time per supplier for a given material |
| GET | `/api/compras/alertas/` | Critical/warning inventory alerts (params: `critico_max`, `atencao_max`) |
| GET | `/api/compras/estoque-tabela/` | Inventory table with status classification (paginated, sortable) |

**Request and response examples:**

```http
GET /api/projetos/1/resumo/
```

```json
{
  "id": 1,
  "codigo_projeto": "PROJ-001",
  "nome_projeto": "Systems Integration",
  "responsavel": "John Smith",
  "status": "In progress",
  "data_inicio": "2024-01-15",
  "data_fim_prevista": "2024-12-31",
  "total_horas": 1240.5,
  "custo_total": 98450.00
}
```

```http
GET /api/compras/alertas/?critico_max=30&atencao_max=60
```

```json
{
  "critico": [
    { "material": "UTP Cat6 Cable", "estoque": 12, "lead_time_medio": 25 }
  ],
  "atencao": [
    { "material": "24-port Switch", "estoque": 45, "lead_time_medio": 55 }
  ]
}
```

---

### 1.4 Technologies and Rationale

| Technology | Rationale |
|------------|-----------|
| **Vue.js 3** | Native reactivity (Composition API), reusable components, straightforward integration with charting libraries such as ApexCharts, and TypeScript support. |
| **Django + DRF** | Powerful ORM, built-in admin interface, easy REST API creation with serializers and class-based views, plus a robust ecosystem for ETL scripts via management commands. |
| **PostgreSQL** | Robust relational database with analytical query support, referential integrity via foreign keys, and excellent performance with the star schema. |
| **Docker** | Ensures reproducibility of the development environment by isolating the database via `docker-compose.yml` and eliminating configuration discrepancies between machines. |
| **Pandas** | Used in the ETL process to read, correct, and transform CSVs before loading them into the database. |

---

## 2. Database Structure

The project adopts the **Star Schema**, common in analytical applications. Dimension tables (`dim_*`) describe business entities, while fact tables (`fato_*`) store measurable metrics with references to those dimensions.

### 2.1 Entity-Relationship Diagram

```
                ┌────────────────────────────────────────────────────────────┐
                │                      STAR SCHEMA                           │
                └──────────────────────────┬─────────────────────────────────┘
                                           │
          ┌─────────────────────────────────────────────────────────────────────────┐
          │                           │                   │                         │
          ▼                           ▼                   ▼                         ▼
  ┌────────────────┐         ┌─────────────────┐  ┌──────────────────┐     ┌──────────────────┐
  │  fato_horas    │         │ fato_materiais  │  │  fato_compras    │     │  fato_estoque    │
  └───────┬────────┘         └────────┬────────┘  └────────┬─────────┘     └────────┬─────────┘
          │                           │                    │                        │
          ├─ dim_tempo ───────────────┼────────────────────┼────────────────────────│
          ├─ dim_projeto ─────────────┼────────────────────┼────────────────────────│
          ├─ dim_programa ────────────│                    │                        │
          ├─ dim_tarefa               │                    │                        │
          └─ dim_funcionario          │                    │                        │
                                      ├─ dim_material ─────┼────────────────────────┘
                                      └─ dim_fornecedor ───│
                                                           └─ dim_status_pedido
```

> **Dimensional hierarchy:** `dim_programa` → `dim_projeto` → `dim_tarefa`

| Fact Table | Dimension FKs |
|---|---|
| `fato_horas` | `dim_tempo`, `dim_projeto`, `dim_programa`, `dim_tarefa`, `dim_funcionario` |
| `fato_materiais` | `dim_tempo`, `dim_projeto`, `dim_programa`, `dim_material`, `dim_fornecedor` |
| `fato_compras` | `dim_tempo`, `dim_projeto`, `dim_material`, `dim_fornecedor`, `dim_status_pedido` |
| `fato_estoque` | `dim_tempo`, `dim_projeto`, `dim_material` |

<!--
        int id PK
        string codigo_programa
        string nome_programa
        string gerente_programa
        date data_inicio
        date data_fim_prevista
        string status
    }

    dim_projeto {
        int id PK
        string codigo_projeto
        string nome_projeto
        int programa_id FK
        string responsavel
        decimal custo_hora
        string status
        date data_inicio
        date data_fim_prevista
    }

    dim_tarefa {
        int id PK
        string codigo_tarefa
        int projeto_id FK
        string titulo
        string responsavel
        decimal horas_estimadas
        string status
    }

    dim_funcionario {
        int id PK
        string nome
    }

    dim_material {
        int id PK
        string codigo_material
        string descricao
        string categoria
        string fabricante
        decimal custo_estimado
        string status
    }

    dim_fornecedor {
        int id PK
        string codigo_fornecedor
        string razao_social
        string cidade
        string estado
        string categoria
        string status
    }

    dim_status_pedido {
        int id PK
        string nome_status
        string categoria
        int ordem_prioridade
    }

    dim_tempo {
        int id PK
        date data
        int ano
        int mes
        int trimestre
        int semestre
        int dia_semana
    }

    fato_horas {
        int id PK
        int tempo_id FK
        int projeto_id FK
        int programa_id FK
        int tarefa_id FK
        int funcionario_id FK
        decimal horas_trabalhadas
        decimal custo_horas
    }

    fato_materiais {
        int id PK
        int tempo_id FK
        int projeto_id FK
        int programa_id FK
        int material_id FK
        int fornecedor_id FK
        int quantidade_empenhada
        decimal custo_materiais
    }

    fato_compras {
        int id PK
        int tempo_id FK
        int projeto_id FK
        int material_id FK
        int fornecedor_id FK
        int status_id FK
        int quantidade_solicitada
        int quantidade_entregue
        decimal valor_alocado
        decimal valor_total
        int lead_time
        date data_previsao_entrega
    }

    fato_estoque {
        int id PK
        int tempo_id FK
        int material_id FK
        int projeto_id FK
        int quantidade_estoque
    }

    dim_programa ||--o{ dim_projeto : "has"
    dim_projeto ||--o{ dim_tarefa : "has"
    dim_projeto ||--o{ fato_horas : "referenced in"
    dim_programa ||--o{ fato_horas : "referenced in"
    dim_tarefa ||--o{ fato_horas : "referenced in"
    dim_funcionario ||--o{ fato_horas : "referenced in"
    dim_tempo ||--o{ fato_horas : "referenced in"
    dim_projeto ||--o{ fato_materiais : "referenced in"
    dim_programa ||--o{ fato_materiais : "referenced in"
    dim_material ||--o{ fato_materiais : "referenced in"
    dim_fornecedor ||--o{ fato_materiais : "referenced in"
    dim_tempo ||--o{ fato_materiais : "referenced in"
    dim_projeto ||--o{ fato_compras : "referenced in"
    dim_material ||--o{ fato_compras : "referenced in"
    dim_fornecedor ||--o{ fato_compras : "referenced in"
    dim_status_pedido ||--o{ fato_compras : "referenced in"
    dim_tempo ||--o{ fato_compras : "referenced in"
    dim_material ||--o{ fato_estoque : "referenced in"
    dim_projeto ||--o{ fato_estoque : "referenced in"
    dim_tempo ||--o{ fato_estoque : "referenced in"
-->

---

### 2.2 Main Tables

#### Dimensions

| Table | Purpose |
|-------|---------|
| `dim_programa` | Groups projects into strategic programs. Contains manager, dates, and program status. |
| `dim_projeto` | Each project linked to a program. Holds the responsible person, cost per hour, and execution period. |
| `dim_tarefa` | Unit of work within a project. Stores estimated hours and task status. |
| `dim_funcionario` | Simple employee registry (unique name) extracted from hours entries. |
| `dim_material` | Material catalog with description, category, manufacturer, and estimated cost. |
| `dim_fornecedor` | Suppliers with location (city/state), category, and activity status. |
| `dim_status_pedido` | Domain of purchase order statuses (Open, Sent, Delivered, etc.) with ordering and category. |
| `dim_tempo` | Analytical calendar from 2022 to 2026. Enables filters by year, month, quarter, and semester. |

#### Facts

| Table | Purpose | Metrics |
|-------|---------|---------|
| `fato_horas` | Records hours worked by an employee on a task/project/date. | `horas_trabalhadas`, `custo_horas` |
| `fato_materiais` | Material commitments in projects over time. | `quantidade_empenhada`, `custo_materiais` |
| `fato_compras` | Material purchase orders with delivery tracking and lead time. | `quantidade_solicitada`, `quantidade_entregue`, `valor_alocado`, `valor_total`, `lead_time` |
| `fato_estoque` | Snapshot of inventory quantity per material, project, and date. | `quantidade_estoque` |

---

### 2.3 Integrity Rules and Constraints

- **Foreign keys with `CASCADE`:** All FKs in fact tables (`fato_horas`, `fato_materiais`, `fato_compras`, `fato_estoque`) use `ON DELETE CASCADE`, ensuring that removing a dimension also removes its associated facts.
- **Dimension cascade:** `dim_projeto` references `dim_programa` with `CASCADE`; `dim_tarefa` references `dim_projeto` with `CASCADE`.
- **Required fields (`NOT NULL`):** All metric columns in fact tables have `default=0`, ensuring no record is left without a value. FK columns in fact tables are required (except `projeto_id` in `fato_compras`, which can be null when a purchase is not tied to a specific project).
- **Unique values:** `codigo_programa`, `codigo_projeto`, `codigo_tarefa`, `codigo_material`, and `codigo_fornecedor` are unique within their respective dimensions. `nome_status` is unique in `dim_status_pedido`.
- **Indexes:** Fact tables have indexes on `tempo_id`, `projeto_id`, and `material_id` to optimize analytical queries used by dashboards.

---

### 2.4 Query Examples for Dashboards

#### Query 1 — Accumulated hours per employee in a project (Django ORM)

Used in the project details dashboard for the hours-per-employee bar chart:

```python
from django.db.models import Sum
from api.models import FatoHoras

def get_horas_por_funcionario(projeto_id, data_inicio=None, data_fim=None):
    qs = FatoHoras.objects.filter(projeto_id=projeto_id)

    if data_inicio:
        qs = qs.filter(tempo__data__gte=data_inicio)
    if data_fim:
        qs = qs.filter(tempo__data__lte=data_fim)

    return (
        qs
        .values('funcionario__nome')
        .annotate(total_horas=Sum('horas_trabalhadas'))
        .order_by('funcionario__nome')
    )
```

Equivalent SQL:

```sql
SELECT df.nome AS employee,
       SUM(fh.horas_trabalhadas) AS total_hours
  FROM fato_horas fh
  JOIN dim_funcionario df ON fh.funcionario_id = df.id
 WHERE fh.projeto_id = 1
   AND fh.tempo_id IN (
       SELECT id FROM dim_tempo WHERE data BETWEEN '2024-01-01' AND '2024-12-31'
   )
 GROUP BY df.nome
 ORDER BY df.nome;
```

---

#### Query 2 — Total material cost per project (Django ORM)

Used in the material cost card on the project summary:

```python
from django.db.models import Sum
from api.models import FatoMateriais

def get_custo_materiais_projeto(projeto_id):
    resultado = (
        FatoMateriais.objects
        .filter(projeto_id=projeto_id)
        .aggregate(custo_total=Sum('custo_materiais'))
    )
    return resultado['custo_total'] or 0
```

Equivalent SQL:

```sql
SELECT SUM(fm.custo_materiais) AS total_cost
  FROM fato_materiais fm
 WHERE fm.projeto_id = 1;
```

---

#### Query 3 — Lead time per supplier for a material (Django ORM)

Used in the purchasing dashboard for supplier analysis:

```python
from api.models import FatoCompras

compras = (
    FatoCompras.objects
    .filter(material_id=material_id, lead_time__isnull=False)
    .select_related('fornecedor', 'status', 'tempo')
)
```

Equivalent SQL:

```sql
SELECT df.razao_social AS supplier,
       fc.lead_time,
       fc.valor_total AS total_value,
       dsp.nome_status AS status,
       dt.data AS order_date
  FROM fato_compras fc
  JOIN dim_fornecedor df     ON fc.fornecedor_id = df.id
  JOIN dim_status_pedido dsp ON fc.status_id = dsp.id
  JOIN dim_tempo dt          ON fc.tempo_id = dt.id
 WHERE fc.material_id = 42
   AND fc.lead_time IS NOT NULL
 ORDER BY dt.data;
```

</details>

→ <a href="#23-de-fevereiro">Back to top</a>

---

<span id="run-use-and-test-the-project">
    
## 🚀 Run, Use and Test the Project

TODO (Sprint 3)
<details>

<summary>Click here</summary>
A

</details>

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
