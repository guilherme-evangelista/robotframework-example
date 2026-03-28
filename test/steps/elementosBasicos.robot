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
    Click Element    ${DROPDOWN_FRAMEWORK}
    # Monta o locator dinâmico e clica (ex: playwright, cypress)
    ${locator_opcao}=    Set Variable    //button[@data-testid='select-option-${NOME_FRAMEWORK}']
    Wait Until Element Is Visible    ${locator_opcao}
    Click Element                    ${locator_opcao}

Quando altero o valor do slider para
    [Arguments]    ${VALOR}
    # Executa o JS para atualizar o input range e disparar o evento de mudança na tela
    Execute Javascript    document.querySelector("input[data-testid='range-input']").value = ${VALOR};
    Execute Javascript    document.querySelector("input[data-testid='range-input']").dispatchEvent(new Event('input', { bubbles: true }));

Quando clico no interruptor
    Click Element    ${SWITCH_INTERRUPTOR}

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
    # Valida se o texto dentro do botão do dropdown reflete a escolha
    Element Should Contain    ${DROPDOWN_FRAMEWORK}    ${TEXTO_ESPERADO}

Entao valido que o slider possui o valor
    [Arguments]    ${VALOR_ESPERADO}
    # Captura o atributo 'value' do input e compara
    ${VALOR_ATUAL}=    Get Element Attribute    ${SLIDER_INTERVALO}    value
    Should Be Equal As Strings    ${VALOR_ATUAL}    ${VALOR_ESPERADO}

Entao valido que o interruptor esta ativado
    # Com base no HTML da imagem anterior, o status fica no 'aria-checked'
    ${STATUS}=    Get Element Attribute    ${SWITCH_INTERRUPTOR}    aria-checked
    Should Be Equal As Strings    ${STATUS}    true

Entao valido que o interruptor esta desativado
    ${STATUS}=    Get Element Attribute    ${SWITCH_INTERRUPTOR}    aria-checked
    Should Be Equal As Strings    ${STATUS}    false