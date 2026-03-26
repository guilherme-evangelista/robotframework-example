# 🤖 Automação Web - Robot Framework & Selenium

Este repositório contém um projeto de automação de testes E2E (End-to-End) voltado para aplicações Web. O framework foi estruturado utilizando **Robot Framework** com a **SeleniumLibrary**, aplicando as melhores práticas de mercado como **BDD (Behavior Driven Development)**, **Page Objects** e abstração de comandos em **Custom Keywords**.

## 📊 Relatório de Testes (Living Documentation)

O projeto possui uma esteira contínua que gera e hospeda o relatório de execução automaticamente após cada atualização no código. 

Você pode visualizar o status atual dos testes e os logs detalhados (com screenshots em caso de falha) clicando no link abaixo:

👉 **[Acessar Relatório de Execução (Report.html)](https://guilherme-evangelista.github.io/RobotFrameworkExample/report.html)**

---

## ⚙️ CI/CD (Integração e Entrega Contínuas)

Este projeto utiliza o **GitHub Actions** para garantir a qualidade contínua. A esteira (`robot-ci.yml`) está configurada para rodar automaticamente a cada `push` ou `pull_request` nas branchs principais.

**O fluxo automatizado realiza as seguintes etapas:**
1. **Setup de Ambiente:** Prepara uma máquina virtual Ubuntu e instala o Python 3.10.
2. **Dependências:** Instala o Robot Framework e bibliotecas via `requirements.txt`.
3. **Display Virtual:** Configura o `Xvfb` (X Virtual Framebuffer) para simular uma interface gráfica, permitindo que o Chrome rode perfeitamente no servidor Linux sem precisar do modo *headless*.
4. **Execução:** Roda todos os cenários de teste mapeados na pasta `features`.
5. **Artefatos:** Salva os logs de execução e screenshots na nuvem do GitHub (disponíveis para download por 7 dias).
6. **Deploy no Pages:** Publica os arquivos `report.html` e `log.html` gerados na branch `gh-pages`, atualizando o link do relatório público.
## 🛠️ Tecnologias e Bibliotecas Utilizadas

* [Python 3](https://www.python.org/) - Linguagem base.
* [Robot Framework](https://robotframework.org/) - Core do framework de automação.
* [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html) - Interação com os elementos Web.
* [FakerLibrary](https://pypi.org/project/robotframework-faker/) - Geração de massa de dados dinâmicos.

## 📂 Arquitetura do Projeto

A arquitetura foi desenhada para garantir fácil manutenção, escalabilidade e reuso de código:

```text
RobotFrameworkExample/
│
├── resources/
│   ├── base.robot              # Ponto central de importações (Libraries, Pages, Steps)
│   └── globalKeywords.robot    # Abstrações do Selenium (Waits customizados, cliques, etc.)
│
├── test/
│   ├── features/               # Arquivos .robot com os Casos de Teste (Cenários em BDD)
│   ├── pages/                  # Mapeamento de elementos da tela (Locators: XPath, CSS, IDs)
│   └── steps/                  # Implementação das palavras-chave (Dado, Quando, Entao)
│
├── requirements.txt            # Lista de dependências do projeto
└── .gitignore                  # Regras de exclusão para o repositório
```

## 🚀 Como Configurar e Instalar

**1. Clone o repositório:**
```bash
git clone [https://github.com/seu-usuario/seu-repositorio.git](https://github.com/seu-usuario/seu-repositorio.git)
cd RobotFrameworkExample
```

**2. Crie e ative um ambiente virtual (Recomendado):**
```bash
# Windows
python -m venv .venv
.venv\Scripts\activate

# Linux/MacOS
python3 -m venv .venv
source .venv/bin/activate
```

**3. Instale as dependências:**
Com o ambiente virtual ativado, instale todas as bibliotecas necessárias com um único comando:
```bash
pip install -r requirements.txt
```

## ▶️ Como Executar os Testes

O projeto utiliza **Tags** para facilitar a execução de testes específicos. Você pode rodar as suítes pelo terminal usando o comando `robot`.

**Executar todos os testes:**
```bash
robot -d ./logs test/features/
```

**Executar um cenário específico por Tag (ex: CT-00):**
```bash
robot -d ./logs -i CT-00 test/features/
```

**Executar testes de uma frente específica (ex: qa.front):**
```bash
robot -d ./logs -i qa.front test/features/
```

> **Dica:** O parâmetro `-d ./logs` direciona os relatórios gerados (`report.html`, `log.html` e `output.xml`) para uma pasta específica, mantendo a raiz do projeto limpa.

## 📝 Boas Práticas Adotadas

* **Waits Implícitos/Explícitos:** Uso de `Wait Until Element Is Visible` nas Custom Keywords (`globalKeywords.robot`) para evitar testes intermitentes (flaky tests).
* **Organização Semântica:** Uso de Gherkin (Dado, Quando, Então) nos testes para facilitar o entendimento de pessoas não técnicas.
* **Gestão de Sessão:** Abertura e fechamento do navegador centralizados nos `Test Setup` e `Test Teardown`.