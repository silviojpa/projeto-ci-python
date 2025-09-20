# 🚀 Projeto DevOps: Pipeline de CI/CD e Containerização

Este projeto demonstra as melhores práticas de **Engenharia DevOps** ao automatizar a **Integração Contínua (CI)**, a **Containerização** e a simulação de **Entrega Contínua (CD)** de uma aplicação Flask (Python) usando **GitHub Actions**.

O objetivo é transformar qualquer alteração no código-fonte em uma **imagem Docker pronta para deploy**, garantindo qualidade e portabilidade.

---

## ✅ Status do Pipeline

O "Status Badge" abaixo reflete o resultado do último build. Se estiver **passing**, significa que o código passou por todas as etapas: Linting, Testes, e o Build da Imagem Docker.

[![Status do Workflow CI/CD](https://github.com/SEU_USUARIO_AQUI/SEU_REPOSITORIO_AQUI/actions/workflows/main.yml/badge.svg)](https://github.com/SEU_USUARIO_AQUI/SEU_REPOSITORIO_AQUI/actions/workflows/main.yml)

> **⚠️ Importante:** Lembre-se de substituir `SEU_USUARIO_AQUI` e `SEU_REPOSITORIO_AQUI` na linha do código acima para que o badge funcione no seu projeto.

---

## 🛠️ Pipeline CI/CD e Boas Práticas DevOps

O pipeline é composto por três estágios (Jobs) sequenciais que garantem que apenas artefatos válidos e seguros sejam criados.

### 1. Job: `qualidade_de_codigo` (Code Quality)
* **Ferramenta:** `flake8`
* **Foco DevOps:** **Prevenção de Débito Técnico**. Garante que o código Python siga o estilo padrão (PEP 8), falhando o pipeline se o código estiver mal formatado.

### 2. Job: `testes_funcionais` (Automated Testing)
* **Ferramenta:** `pytest`
* **Foco DevOps:** **Verificação de Funcionalidade**. Roda testes unitários na aplicação para confirmar que a lógica está correta e que a aplicação é funcional antes de prosseguir.
* **Dependência:** Só é executado se o job de qualidade for bem-sucedido.

### 3. Job: `build_and_push_docker` (Containerization & Artifact Creation)
* **Ferramenta:** `docker/build-push-action`, `docker/login-action`
* **Foco DevOps:** **Criação de Artefato Portátil**.
    * Constrói a imagem Docker usando o `Dockerfile`.
    * Faz o login seguro no **Docker Hub** usando Secrets (Credenciais armazenadas com segurança).
    * Realiza o **Push** da imagem com a tag **`latest`** (e a tag SHA do commit) para o registro.
* **Resultado:** A aplicação agora é uma **Imagem Docker** acessível globalmente, pronta para implantação em qualquer ambiente de produção.

---

## ☁️ Simulação de Continuous Delivery (CD)

O último Job garante que sua aplicação esteja pronta para **Continuous Delivery (CD)**. Embora esta fase exija credenciais de nuvem, o processo de deployment seria o seguinte:

### Cenário 1: AWS Fargate (Serverless Containers)
* O pipeline usaria a **AWS CLI** (via `aws-actions/configure-aws-credentials`).
* Ele **atualizaria a Definição de Tarefa (Task Definition)** do Amazon ECS Fargate, substituindo a referência da imagem Docker antiga pela **nova tag** que foi enviada para o Docker Hub.
* O Serviço ECS orquestraria a substituição automática dos containers antigos pelos novos.

### Cenário 2: Azure App Service for Containers
* O pipeline usaria a Action **`azure/webapps-deploy`**.
* Ele apontaria o **App Service** (que é o ambiente de host do Azure) para a **nova tag de imagem** no Docker Hub.
* O Azure App Service faria o *pull* da nova imagem e reiniciaria o container, concluindo o deployment.

---

## 💻 Estrutura do Projeto

| Arquivo/Pasta | Descrição |
| :--- | :--- |
| **`Dockerfile`** | Instruções de Containerização. Define como a imagem Python é construída. |
| `app.py` | Aplicação Flask principal. |
| `requirements.txt` | Lista as dependências do projeto. |
| `tests/test_app.py` | Contém o teste unitário. |
| `.github/workflows/main.yml` | **O Cérebro do Projeto:** Define e orquestra o pipeline CI/CD completo, do Lint ao Push do Docker. |
