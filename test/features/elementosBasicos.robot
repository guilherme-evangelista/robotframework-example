*** Settings ***
Resource    ../../resources/base.robot
Test Setup    Abrir Sessao
Test Teardown    Fechar Sessao

*** Test Cases ***
CT-00 - Validação visualizar página inicial
    [Tags]  CT-00     qa.front    guilherme.evangelista
    Dado que estou na tela incicial QA Playground

CT-01 - Interação com o botão Clique aqui
    [Tags]  CT-01     qa.front    guilherme.evangelista
    Dado que estou na tela incicial QA Playground
    Quando clico no botão clique aqui
    Entao valido que o botão clique aqui possui um clique

CT-02 - Interação com o botão Duplo Clique
    [Tags]  CT-02     qa.front    guilherme.evangelista
    Dado que estou na tela incicial QA Playground
    Quando clico no botão duplo clique
    Entao valido que o botão duplo clique possui um clique

CT-03 - Interação com o campo de texto
    [Tags]  CT-03     qa.front    guilherme.evangelista
    Dado que estou na tela incicial QA Playground
    Quando escrevo no campo de texto        teste
    Entao valido que o campo de texto possui digitado    teste




