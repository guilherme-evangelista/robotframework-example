*** Settings ***
Resource    ../../resources/base.robot
Test Setup    Abrir Sessao
Test Teardown    Fechar Sessao

*** Test Cases ***
CT-01 - Cadastro realizado com sucesso
    [Tags]    CT-01    qa.front    guilherme.evangelista
    Dado que estou na aba de Formulários Simples
    Quando preencho o formulário com dados válidos e aceito os termos
    E clico no botão Enviar
    Então visualizo a mensagem de sucesso "Formulário enviado com sucesso!"

CT-02 - Tentativa de cadastro sem aceitar os termos
    [Tags]    CT-02    qa.front    guilherme.evangelista
    Dado que estou na aba de Formulários Simples
    Quando preencho todos os campos de texto corretamente
    E clico no botão Enviar sem aceitar os termos
    Então visualizo a mensagem de erro "Você deve aceitar os termos"

CT-03 - Limpar campos do formulário
    [Tags]    CT-03    qa.front    guilherme.evangelista
    Dado que estou na aba de Formulários Simples
    Quando preencho todos os campos de texto corretamente
    E clico no botão Limpar
    Então verifico que todos os campos do formulário foram resetados

CT-04 - Validar obrigatoriedade do campo Nome
    [Tags]    CT-04    qa.front    guilherme.evangelista
    Dado que estou na aba de Formulários Simples
    Quando preencho o formulário exceto o campo "Nome"
    E clico no botão Enviar
    Então visualizo a mensagem de erro "Nome é obrigatório"

CT-05 - Validar obrigatoriedade do campo Email
    [Tags]    CT-05    qa.front    guilherme.evangelista
    Dado que estou na aba de Formulários Simples
    Quando preencho o formulário exceto o campo "Email"
    E clico no botão Enviar
    Então visualizo a mensagem de erro "Email é obrigatório"

CT-06 - Validar obrigatoriedade do campo Senha
    [Tags]    CT-06    qa.front    guilherme.evangelista
    Dado que estou na aba de Formulários Simples
    Quando preencho o formulário exceto o campo "Senha"
    E clico no botão Enviar
    Então visualizo a mensagem de erro "Senha é obrigatória"

CT-07 - Validar erro de confirmação de senha divergente
    [Tags]    CT-07    qa.front    guilherme.evangelista
    Dado que estou na aba de Formulários Simples
    Quando preencho a senha "SENHA_VALIDA" e a confirmação "SENHA_ERRADA"
    E clico no botão Enviar
    Então visualizo a mensagem de erro "Senhas não coincidem"
