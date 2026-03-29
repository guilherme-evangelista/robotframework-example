*** Settings ***
Resource    ../../resources/base.robot

*** Keywords ***
Dado que estou na tela incicial QA Playground
    ${url_atual}=    Get Location
    Should Be Equal    ${url_atual}    ${URL}
    
Quando clico no botão clique aqui
    Clicar No Elemento    ${BTN_CLIQUE_AQUI}

Quando clico no botão duplo clique
    Duplo Clique No Elemento    ${BTN_DUPLO_CLIQUE}
    
Quando escrevo no campo de texto
    [Arguments]    ${TEXTO}
    Preencher Texto    ${INPUT_TEXTO_BASICO}    ${TEXTO}

Quando seleciono a opcao no dropdown de framework
    [Arguments]    ${NOME_FRAMEWORK}
    Clicar No Elemento    ${DROPDOWN_FRAMEWORK}
    ${locator_opcao}=    Set Variable    //button[@data-testid='select-option-${NOME_FRAMEWORK}']
    Clicar No Elemento                    ${locator_opcao}

Quando altero o valor do slider para
    [Arguments]    ${VALOR}
    Arrastar Slider para valor     ${SLIDER_INTERVALO}    ${VALOR}

Quando clico no interruptor
    Clicar No Elemento    ${SWITCH_INTERRUPTOR}

Entao valido que o botão clique aqui possui um clique
    Validar Texto No Elemento    ${BTN_CLIQUE_AQUI}    1

Entao valido que o botão duplo clique possui um clique
    Validar Texto No Elemento    ${BTN_DUPLO_CLIQUE}    1
    
Entao valido que o campo de texto possui digitado
    [Arguments]    ${TEXTO_VALIDACAO}
    ${TEXTO_DIGITADO}=    Obter Valor Do Campo    ${INPUT_TEXTO_BASICO}
    Should Be Equal    ${TEXTO_DIGITADO}    ${TEXTO_VALIDACAO}

Entao valido que o dropdown de framework exibe a opcao
    [Arguments]    ${TEXTO_ESPERADO}
    Element Should Contain    ${DROPDOWN_FRAMEWORK}    ${TEXTO_ESPERADO}

Entao valido que o slider possui o valor
    [Arguments]    ${VALOR_ESPERADO}
    ${VALOR_ATUAL}=    Get Element Attribute    ${SLIDER_INTERVALO}    value
    Should Be Equal As Strings    ${VALOR_ATUAL}    ${VALOR_ESPERADO}

Entao valido que o interruptor esta ativado
    ${STATUS}=    Get Element Attribute    ${SWITCH_INTERRUPTOR}    aria-checked
    Should Be Equal As Strings    ${STATUS}    true

Entao valido que o interruptor esta desativado
    ${STATUS}=    Get Element Attribute    ${SWITCH_INTERRUPTOR}    aria-checked
    Should Be Equal As Strings    ${STATUS}    false