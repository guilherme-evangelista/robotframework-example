*** Settings ***
Resource    ../../resources/base.robot

*** Variables ***
# --- Locators: Eventos de Clique ---
${BTN_CLIQUE_AQUI}          //button[contains(text(), 'Clique aqui')]
${BTN_DUPLO_CLIQUE}         //button[contains(text(), 'Duplo clique')]

# --- Locators: Campo de Texto ---
${INPUT_TEXTO_BASICO}       //input[@placeholder='Digite algo...']

# --- Locators: Seleção (Dropdown) ---
${DROPDOWN_FRAMEWORK}       //button[@data-testid='select-input']
${OPT_PLAYWRIGHT}           //button[@data-testid='select-option-playwright']
${OPT_CYPRESS}              //button[@data-testid='select-option-cypress']
${OPT_SELENIUM}             //button[@data-testid='select-option-selenium']
${OPT_ROBOT}                //button[@data-testid='select-option-robot']

# --- Locators: Controles ---
${SLIDER_INTERVALO}         //input[@data-testid='range-input']
${SWITCH_INTERRUPTOR}       //button[@data-testid='toggle-switch']