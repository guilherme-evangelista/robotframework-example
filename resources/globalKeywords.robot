*** Settings ***
Resource        ../resources/base.robot

*** Keywords ***

# ==========================================
# GERENCIAMENTO DO NAVEGADOR
# ==========================================
Abrir Sessao
    [Documentation]    Abre o navegador na URL com opções otimizadas para CI/CD.

    ${options}         Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    Call Method        ${options}  add_argument    --no-sandbox
    Call Method        ${options}  add_argument    --disable-dev-shm-usage
    Call Method        ${options}  add_argument    --disable-gpu
    Call Method        ${options}  add_argument    --window-size\=1920,1080

    Open Browser       ${URL}    ${BROWSER}    options=${options}

Fechar Sessao
    [Documentation]    Tira uma evidência e fecha o navegador ao final do teste.
    Capture Page Screenshot
    Close Browser

# ==========================================
# AÇÕES ABSTRAÍDAS COM WAITS
# ==========================================
Clicar No Elemento
    [Arguments]    ${locator}    ${timeout}=15s
    [Documentation]    Aguarda o elemento ficar visível e habilitado para clique, e então clica.
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    ${locator}    timeout=${timeout}
    Click Element                    ${locator}

Preencher Texto
    [Arguments]    ${locator}    ${texto}    ${timeout}=15s
    [Documentation]    Aguarda o elemento ficar visível e habilitado, e então insere o texto.
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    ${locator}    timeout=${timeout}
    Input Text                       ${locator}    ${texto}

Obter Valor Do Campo
    [Arguments]    ${locator}    ${timeout}=15s
    [Documentation]    Retorna o valor (texto) digitado em um campo de input.
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    ${valor_digitado}                Get Value     ${locator}
    RETURN                           ${valor_digitado}

Limpar E Preencher Texto
    [Arguments]    ${locator}    ${texto}    ${timeout}=15s
    [Documentation]    Limpa o campo antes de inserir o novo texto.
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    ${locator}    timeout=${timeout}
    Clear Element Text               ${locator}
    Input Text                       ${locator}    ${texto}

Duplo Clique No Elemento
    [Arguments]    ${locator}    ${timeout}=15s
    [Documentation]    Aguarda o elemento e executa um duplo clique.
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    ${locator}    timeout=${timeout}
    Double Click Element             ${locator}

# ==========================================
# INTERAÇÕES AVANÇADAS
# ==========================================
Passar O Mouse No Elemento (Hover)
    [Arguments]    ${locator}    ${timeout}=15s
    [Documentation]    Simula o comportamento de colocar o ponteiro do mouse sobre o elemento.
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Mouse Over                       ${locator}

Arrastar E Soltar Elemento
    [Arguments]    ${locator_origem}    ${locator_destino}    ${timeout}=15s
    [Documentation]    Clica e segura um elemento, arrastando-o até um elemento de destino.
    Wait Until Element Is Visible    ${locator_origem}     timeout=${timeout}
    Wait Until Element Is Visible    ${locator_destino}    timeout=${timeout}
    Drag And Drop                    ${locator_origem}     ${locator_destino}

Arrastar Slider Por Offset
    [Arguments]    ${locator}    ${x_offset}    ${y_offset}=0    ${timeout}=15s
    [Documentation]    Move um slider com base em coordenadas X (horizontal) e Y (vertical).
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Drag And Drop By Offset          ${locator}    ${x_offset}    ${y_offset}

# ==========================================
# INTERAÇÕES COM LISTAS (DROPDOWNS / SELECTS)
# ==========================================
Selecionar Item Na Lista Por Texto
    [Arguments]    ${locator}    ${texto_visivel}    ${timeout}=15s
    [Documentation]    Seleciona uma opção em um <select> baseando-se no texto visível para o usuário.
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Select From List By Label        ${locator}    ${texto_visivel}

Selecionar Item Na Lista Por Valor
    [Arguments]    ${locator}    ${atributo_value}    ${timeout}=15s
    [Documentation]    Seleciona uma opção em um <select> baseando-se no atributo HTML 'value'.
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Select From List By Value        ${locator}    ${atributo_value}

# ==========================================
# INTERAÇÕES COM CHECKBOX E RADIO BUTTONS
# ==========================================
Marcar Checkbox
    [Arguments]    ${locator}    ${timeout}=15s
    [Documentation]    Aguarda e marca um checkbox (se já estiver marcado, não faz nada).
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Select Checkbox                  ${locator}

Desmarcar Checkbox
    [Arguments]    ${locator}    ${timeout}=15s
    [Documentation]    Aguarda e desmarca um checkbox (se já estiver desmarcado, não faz nada).
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Unselect Checkbox                ${locator}

Selecionar Radio Button
    [Arguments]    ${nome_do_grupo}    ${valor_do_radio}
    [Documentation]    Seleciona um Radio Button. Diferente de outros elementos, ele precisa do 'name' do grupo HTML e do atributo 'value'.
    Select Radio Button              ${nome_do_grupo}    ${valor_do_radio}

# ==========================================
# ROLAGEM DE TELA (SCROLL)
# ==========================================
Rolar Ate O Elemento
    [Arguments]    ${locator}    ${timeout}=15s
    [Documentation]    Rola a página automaticamente até que o elemento especificado fique visível na tela.
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Scroll Element Into View         ${locator}

Rolar Para O Fim Da Pagina
    [Documentation]    Executa um script Javascript para rolar até o final da página.
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)

# ==========================================
# INTERAÇÕES COM IFRAMES
# ==========================================
Entrar No Iframe
    [Arguments]    ${locator}    ${timeout}=15s
    [Documentation]    Muda o foco do Selenium para dentro de um iframe específico.
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Select Frame                     ${locator}

Sair Do Iframe
    [Documentation]    Retorna o foco do Selenium para a página principal padrão.
    Unselect Frame

# ==========================================
# ALERTAS JS E UPLOAD DE ARQUIVOS
# ==========================================
Aceitar Alerta JS
    [Arguments]    ${timeout}=10s
    [Documentation]    Aguarda um alerta Javascript (pop-up do navegador) aparecer e clica em 'OK' / 'Aceitar'.
    Handle Alert    action=ACCEPT    timeout=${timeout}

Fazer Upload De Arquivo
    [Arguments]    ${locator}    ${caminho_absoluto_do_arquivo}    ${timeout}=15s
    [Documentation]    Faz upload de um arquivo. O locator deve apontar para a tag <input type="file">.
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Choose File                      ${locator}    ${caminho_absoluto_do_arquivo}

# ==========================================
# VALIDAÇÕES E VERIFICAÇÕES
# ==========================================
Validar Elemento Na Tela
    [Arguments]    ${locator}    ${timeout}=15s
    [Documentation]    Valida se um elemento específico está visível na tela.
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Page Should Contain Element      ${locator}

Validar Texto No Elemento
    [Arguments]    ${locator}    ${texto_esperado}    ${timeout}=15s
    [Documentation]    Aguarda o elemento e valida se ele contém o texto esperado.
    Wait Until Element Is Visible    ${locator}             timeout=${timeout}
    Element Should Contain           ${locator}             ${texto_esperado}

Validar Texto Na Pagina
    [Arguments]    ${texto_esperado}    ${timeout}=15s
    [Documentation]    Aguarda até que um texto específico apareça em qualquer lugar da página.
    Wait Until Page Contains         ${texto_esperado}      timeout=${timeout}
