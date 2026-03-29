*** Settings ***
###PAGES
Resource               ../test/pages/elementosBasicos.robot
Resource               ../test/pages/navegacaoRapida.robot
Resource               globalKeywords.robot

###STEPS
Resource               ../test/steps/elementosBasicos.robot

###LIBRARIES
Library                String
Library                OperatingSystem
Library                Collections
Library                DateTime
Library                SeleniumLibrary
Library                FakerLibrary    locale=pt_BR

*** Variables ***
${URL}            https://playground-for-qa.vercel.app/playground
${BROWSER}        chrome