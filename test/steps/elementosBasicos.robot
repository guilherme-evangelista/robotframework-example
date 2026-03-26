*** Settings ***
Resource    ../../resources/base.robot

*** Keywords ***
Dado que estou na tela incicial QA Playground
    ${url_atual}=    Get Location
    Should Be Equal    ${url_atual}    ${URL}
    
Quando clico no botão clique aqui
    Clicar No Elemento    ${BOTAO_CLIQUE_AQUI}

Quando clico no botão duplo clique
    Duplo Clique No Elemento    ${BOTAO_DUPLO_CLIQUE}

Entao valido que o botão clique aqui possui um clique
    Validar Texto No Elemento    ${BOTAO_CLIQUE_AQUI}    1

Entao valido que o botão duplo clique possui um clique
    Validar Texto No Elemento    ${BOTAO_DUPLO_CLIQUE}    1

