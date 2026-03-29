*** Settings ***
Resource    ../../resources/base.robot

*** Variables ***
${INPUT_NOME}               //input[@data-testid='input-name']
${INPUT_EMAIL}              //input[@data-testid='input-email']
${INPUT_SENHA}              //input[@data-testid='input-password']
${INPUT_CONFIRMAR_SENHA}    //input[@data-testid='input-confirm-password']
${CHECKBOX_TERMOS}          //input[@data-testid='checkbox-terms']
${BTN_ENVIAR}               //button[@data-testid='submit-button']
${BTN_LIMPAR}               //button[@data-testid='clear-button']
