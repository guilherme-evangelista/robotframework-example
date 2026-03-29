*** Settings ***
Resource    ../../resources/base.robot

*** Keywords ***
Dado que estou na aba de Formulários Simples
    Dado que estou na tela incicial QA Playground
    E acesso a aba de Formulários Simples

Quando preencho o formulário com dados válidos e aceito os termos
    ${NOME}     FakerLibrary.Name
    ${EMAIL}    FakerLibrary.Email
    ${SENHA}    FakerLibrary.Password
    Preencher Texto     ${INPUT_NOME}               ${NOME}
    Preencher Texto     ${INPUT_EMAIL}              ${EMAIL}
    Preencher Texto     ${INPUT_SENHA}              ${SENHA}
    Preencher Texto     ${INPUT_CONFIRMAR_SENHA}    ${SENHA}
    Select Checkbox    ${CHECKBOX_TERMOS}

Quando preencho todos os campos de texto corretamente
    ${NOME}     FakerLibrary.Name
    ${EMAIL}    FakerLibrary.Email
    ${SENHA}    FakerLibrary.Password
    Preencher Texto     ${INPUT_NOME}               ${NOME}
    Preencher Texto     ${INPUT_EMAIL}              ${EMAIL}
    Preencher Texto     ${INPUT_SENHA}              ${SENHA}
    Preencher Texto     ${INPUT_CONFIRMAR_SENHA}    ${SENHA}

Quando preencho o formulário exceto o campo "Nome"
    ${EMAIL}    FakerLibrary.Email
    ${SENHA}    FakerLibrary.Password
    Preencher Texto    ${INPUT_EMAIL}              ${EMAIL}
    Preencher Texto    ${INPUT_SENHA}              ${SENHA}
    Preencher Texto    ${INPUT_CONFIRMAR_SENHA}    ${SENHA}
    Marcar Checkbox    ${CHECKBOX_TERMOS}
    
Quando preencho o formulário exceto o campo "Email"
    ${NOME}     FakerLibrary.Name
    ${SENHA}    FakerLibrary.Password
    Preencher Texto    ${INPUT_NOME}               ${NOME}
    Preencher Texto    ${INPUT_SENHA}              ${SENHA}
    Preencher Texto    ${INPUT_CONFIRMAR_SENHA}    ${SENHA}
    Marcar Checkbox    ${CHECKBOX_TERMOS}
    
Quando preencho o formulário exceto o campo "Senha"
    ${NOME}     FakerLibrary.Name
    ${EMAIL}    FakerLibrary.Email
    Preencher Texto    ${INPUT_NOME}               ${NOME}
    Preencher Texto    ${INPUT_EMAIL}              ${EMAIL}
    Marcar Checkbox    ${CHECKBOX_TERMOS}

Quando preencho a senha "${SENHA}" e a confirmação "${CONFIRMACAO}"
    ${NOME}     FakerLibrary.Name
    ${EMAIL}    FakerLibrary.Email
    Preencher Texto    ${INPUT_NOME}               ${NOME}
    Preencher Texto    ${INPUT_EMAIL}              ${EMAIL}
    Preencher Texto    ${INPUT_SENHA}              ${SENHA}
    Preencher Texto    ${INPUT_CONFIRMAR_SENHA}    ${CONFIRMACAO}
    Marcar Checkbox    ${CHECKBOX_TERMOS}

Quando clico no botão Enviar
    Clicar No Elemento      ${BTN_ENVIAR}
E clico no botão Enviar
    Clicar No Elemento      ${BTN_ENVIAR}
E clico no botão Enviar sem aceitar os termos
    Clicar No Elemento      ${BTN_ENVIAR}

E clico no botão Limpar
    Clicar No Elemento      ${BTN_LIMPAR}

Então visualizo a mensagem de sucesso "${MENSAGEM}"
    Wait Until Page Contains    ${MENSAGEM}    timeout=5s

Então visualizo a mensagem de erro "${MENSAGEM}"
    Wait Until Page Contains    ${MENSAGEM}    timeout=5s

Então verifico que todos os campos do formulário foram resetados
    Element Text Should Be    ${INPUT_NOME}               ${EMPTY}
    Element Text Should Be    ${INPUT_EMAIL}              ${EMPTY}
    Checkbox Should Not Be Selected    ${CHECKBOX_TERMOS}