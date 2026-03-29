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

CT-04 - Interação com o dropdown customizado
    [Tags]  CT-04    qa.front    guilherme.evangelista
    Dado que estou na tela incicial QA Playground
    Quando seleciono a opcao no dropdown de framework    robot
    Entao valido que o dropdown de framework exibe a opcao    Robot Framework

CT-05 - Interação com o slider de intervalo
    [Tags]  CT-05    qa.front    guilherme.evangelista
    Dado que estou na tela incicial QA Playground
    Quando altero o valor do slider para    80
    Entao valido que o slider possui o valor    80

CT-06 - Interação com o interruptor (switch) ativado
    [Tags]  CT-06    qa.front    guilherme.evangelista
    Dado que estou na tela incicial QA Playground
    Quando clico no interruptor
    Entao valido que o interruptor esta ativado

CT-07 - Interação com o interruptor (switch) desativado
    [Tags]  CT-07    qa.front    guilherme.evangelista
    Dado que estou na tela incicial QA Playground
    Quando clico no interruptor
    Quando clico no interruptor
    Entao valido que o interruptor esta desativado




