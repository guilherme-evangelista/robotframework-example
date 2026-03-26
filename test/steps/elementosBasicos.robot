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
    
Quando escrevo no campo de texto
    [Arguments]    ${TEXTO}
    Preencher Texto    ${INPUT_DIGITE_ALGO}    ${TEXTO}

Entao valido que o botão clique aqui possui um clique
    Validar Texto No Elemento    ${BOTAO_CLIQUE_AQUI}    1

Entao valido que o botão duplo clique possui um clique
    Validar Texto No Elemento    ${BOTAO_DUPLO_CLIQUE}    1
    
Entao valido que o campo de texto possui digitado
    [Arguments]    ${TEXTO_VALIDACAO}
    ${TEXTO_DIGITADO}=    Obter Valor Do Campo    ${INPUT_DIGITE_ALGO}
    Should Be Equal    ${TEXTO_DIGITADO}    ${TEXTO_VALIDACAO}
    