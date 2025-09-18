# 🚀 Projeto DevOps: Pipeline de CI/CD em Python

Este projeto é um exemplo de boas práticas de Engenharia de Software e DevOps, utilizando **GitHub Actions** para automatizar a **Integração Contínua (CI)** de uma aplicação simples em Flask (Python).

O objetivo é garantir que toda alteração de código seja validada automaticamente antes de ser considerada pronta para o *deployment*.

---

## ✅ Status do Pipeline

O "Status Badge" abaixo reflete o resultado do último build no branch `main`. Se estiver "passing", significa que o código passou por todas as verificações de qualidade e testes.

[![Status do Workflow CI/CD](https://github.com/SEU_USUARIO_AQUI/SEU_REPOSITORIO_AQUI/actions/workflows/main.yml/badge.svg)](https://github.com/SEU_USUARIO_AQUI/SEU_REPOSITORIO_AQUI/actions/workflows/main.yml)

> **⚠️ Importante:** Lembre-se de substituir `SEU_USUARIO_AQUI` e `SEU_REPOSITORIO_AQUI` na linha do código acima para que o badge funcione no seu projeto.

---

## 🛠️ Práticas DevOps Implementadas

O pipeline é composto por dois estágios (Jobs) principais, que garantem a qualidade e a funcionalidade do código:

### 1. Job: `qualidade_de_codigo` (Code Quality)

**Ferramenta:** `flake8`

Este estágio foca na **Qualidade de Código (Linting)**. Ele executa o `flake8` para:
* Garantir que o código Python siga o estilo padrão (PEP 8).
* Evitar erros de sintaxe e complexidade desnecessária.

**Resultado:** Se o `flake8` encontrar problemas, o pipeline falha, prevenindo que código sujo seja integrado.

### 2. Job: `testes_funcionais` (Automated Testing)

**Ferramenta:** `pytest`

Este estágio foca na **Funcionalidade do Código**. Ele:
* Configura o ambiente e as dependências.
* Usa a variável de ambiente `PYTHONPATH` para garantir que o **Pytest** encontre corretamente os módulos da aplicação (uma solução técnica comum em ambientes CI/CD).
* Executa testes unitários que simulam o acesso ao endpoint da aplicação (`/`) para confirmar se a lógica está correta e se o servidor inicializa.

**Dependência:** Este job só é executado se o job de `qualidade_de_codigo` for bem-sucedido, garantindo que só testamos código limpo.

---

## 💻 Estrutura do Projeto

| Arquivo/Pasta | Descrição |
| :--- | :--- |
| `app.py` | Aplicação Flask principal com um *endpoint* simples (`/`). |
| `requirements.txt` | Lista as dependências do projeto: `Flask`, `pytest` e `flake8`. |
| `tests/test_app.py` | Contém o teste unitário que verifica o *endpoint* da aplicação. |
| `.github/workflows/main.yml` | O arquivo de configuração principal que define e orquestra o pipeline de CI/CD. |
