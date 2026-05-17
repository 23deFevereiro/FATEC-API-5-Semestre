# Fluxo de dados do sistema

## Visão geral

O sistema é composto por três camadas principais:

1. **Frontend** em Vue 3 + Pinia, responsável por seleção de filtros, navegação e renderização dos dashboards.
2. **Backend** em Django + DRF, responsável por expor endpoints HTTP, aplicar regras de negócio e consolidar métricas analíticas.
3. **Banco de dados PostgreSQL**, modelado em **schema estrela**, onde os dados tratados são persistidos em dimensões e fatos.

Além da aplicação em execução, existe um fluxo de **ingestão e tratamento de CSV** que prepara os dados antes da carga no banco.

```mermaid
flowchart LR
    CSVs[CSVs originais] --> FIX[fix_csv]
    FIX --> CORR[corrected_documents]
    CORR --> DEVDB[dev_db]
    DEVDB --> SEED[seed_0006]
    SEED --> DB[(PostgreSQL)]
    DB --> SVC[Services do backend]
    SVC --> VIEW[Views / API REST]
    VIEW --> STORE[Stores Pinia]
    STORE --> UI[Paginas e componentes Vue]
```

## Como os dados circulam entre frontend, backend e banco

### 1. Frontend

O frontend centraliza o consumo da API nos **stores Pinia**:

- `useProjetoStore`: abastece a página de projetos com overview, burnup, resumo, materiais, horas por funcionário e tabela de funcionários.
- `useProgramaStore`: abastece a página de programas com resumo, distribuição de status, burnup, horas por projeto e tabela de projetos.
- `usePlanejamentoStore`: abastece a página de planejamento com materiais, lead time, alertas e tabela de estoque.

Os stores usam `axios` e a função `apiUrl()` para montar chamadas para o backend a partir de `VITE_API_URL`.

Um detalhe importante de acoplamento no frontend é o `ProgramaSelector.vue`: ele atualiza o `useProgramaStore` e, ao mesmo tempo, aplica filtro no `useProjetoStore`. Na prática, a seleção de programa atua como ponto de integração entre os dashboards de programas e de projetos.

### 2. Backend

O backend segue um fluxo consistente:

`URL -> view -> service -> models/querysets -> PostgreSQL -> JSON`

- `api/urls.py` concentra os endpoints REST.
- Cada `view` lê query params, valida entrada e delega o processamento para um `service`.
- Os `services` acessam os modelos Django e executam agregações sobre tabelas dimensionais e tabelas fato.
- O resultado é devolvido em `JsonResponse`, consumido pelos stores do frontend.

### 3. Banco de dados

O banco usa um **schema estrela**:

- **Dimensões**: `dim_programa`, `dim_projeto`, `dim_tarefa`, `dim_material`, `dim_fornecedor`, `dim_funcionario`, `dim_status_pedido`, `dim_tempo`
- **Fatos**: `fato_horas`, `fato_materiais`, `fato_compras`, `fato_estoque`

Esse desenho permite que o backend faça consolidações analíticas por período, projeto, programa, material, fornecedor e funcionário sem depender dos CSVs em tempo de execução.

## Fluxos de leitura por módulo do frontend

### Página de projetos

Ao abrir `/projetos`, o store inicializa:

- `GET /api/projetos-overview`
- `GET /api/projetos/burnup-horas/`

Ao selecionar um projeto, o frontend dispara em paralelo:

- `GET /api/projetos/{id}/resumo/`
- `GET /api/projetos/{id}/materiais/`
- `GET /api/projetos/{id}/horas-por-funcionario/`
- `GET /api/projetos/{id}/funcionarios/`
- `GET /api/projetos/{id}/nomes-funcionarios/`
- `GET /api/projetos/{id}/materiais-disponiveis/`

Filtros por período, funcionário e material não alteram estado no banco; eles apenas refinam novas consultas sobre `fato_horas` e `fato_materiais`.

### Página de programas

Ao selecionar um programa, o frontend consulta:

- `GET /api/programas/{id}/resumo/`
- `GET /api/programas/{id}/distribuicao-status/`
- `GET /api/programas/{id}/tabela-projetos/`
- `GET /api/programas/{id}/horas-por-projeto/`

Além disso, os gráficos globais usam:

- `GET /api/programas-burnup-horas/`
- `GET /api/programas-burnup-custo/`

Aqui o backend combina dados de `dim_projeto`, `dim_tarefa`, `fato_horas`, `fato_materiais` e `fato_compras`.

### Página de planejamento

O módulo de planejamento consome:

- `GET /api/compras/materiais/`
- `GET /api/compras/lead-time/?material_id=...`
- `GET /api/compras/alertas/`
- `GET /api/compras/estoque-tabela/`

Essas respostas dependem principalmente de `fato_compras`, `fato_materiais`, `fato_estoque` e `dim_material`.

## Processos de ingestão, tratamento e persistência

### 1. Entrada dos dados

Os arquivos CSV de origem ficam em `api/management/commands/original_documents`.

### 2. Tratamento dos CSVs

O comando `fix_csv`:

- lê os CSVs com **pandas**
- corrige inconsistências de relacionamento e status
- grava os arquivos tratados em `api/management/commands/corrected_documents`

As correções aplicadas hoje são:

1. ajuste do responsável em apontamentos de tempo com base na tarefa
2. ajuste de status de projeto quando o programa já está concluído
3. ajuste de status de tarefa quando o projeto já está concluído
4. ajuste de tarefas em backlog que já possuem horas registradas
5. correção em cascata de programa -> projeto -> tarefa

### 3. Orquestração da carga

O comando `dev_db` coordena a carga:

1. verifica se `corrected_documents` já existe
2. se necessário, executa `fix_csv`
3. aplica migrations pendentes
4. identifica a última migration ativa
5. executa o seed correspondente

Para a aplicação atual, o fluxo compatível é o da **migration `0006`**, que popula o modelo estrela com `data_inicio` e `data_fim_prevista` em `dim_projeto`.

### 4. Persistência no banco

O `seed_0006` lê os CSVs tratados e carrega:

| CSV | Destino principal |
|---|---|
| `programas.csv` | `dim_programa` |
| `projetos_corrigido.csv` | `dim_projeto` |
| `tarefas_projeto_corrigido.csv` | `dim_tarefa` |
| `materiais.csv` | `dim_material` |
| `fornecedores.csv` | `dim_fornecedor` |
| `tempo_tarefas_corrigido.csv` | `dim_funcionario` e `fato_horas` |
| `empenho_materiais_corrigido.csv` | `fato_materiais` |
| `solicitacoes_compra_corrigido.csv` + `pedidos_compra_corrigido.csv` + `compras_projeto.csv` | `fato_compras` |
| `estoque_materiais_projeto.csv` | `fato_estoque` |

`dim_tempo` não vem de CSV: ela é gerada pelo seed para o intervalo de datas configurado no carregamento.

## Dependências entre serviços e módulos do backend

O backend está organizado em camadas com dependências bem definidas.

| Camada | Papel | Dependências principais |
|---|---|---|
| `api/urls.py` | roteamento HTTP | views |
| `api/views/*` | interface REST, validação de entrada, serialização simples | `view_utils`, services |
| `api/services/*` | regras de negócio e agregações analíticas | models, paginação |
| `api/models/*` | acesso ORM ao schema estrela | PostgreSQL |
| `api/management/commands/*` | comandos de execução pelo manage.py | pandas, psycopg2, migrations |

## Pontos de integração com scripts de tratamento de CSV

Os pontos de integração mais importantes são:

1. **`fix_csv` -> `corrected_documents`**  
   Gera a base tratada usada pelo restante do processo.

2. **`dev_db` -> `fix_csv`**  
   Se os arquivos tratados não existirem, o backend dispara automaticamente a correção antes da carga.

3. **Aplicação web -> PostgreSQL**  
   Depois da carga, frontend e backend não dependem mais dos CSVs em tempo real; toda consulta passa a sair do banco relacional já consolidado.
