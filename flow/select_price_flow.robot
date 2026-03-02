*** Settings ***
Resource   ../pages/select_price_page.robot
Resource   ../utils/capturar_page.robot

*** Keywords ***

Selecionar opção de preço
    [Arguments]    ${dados_yaml}

    Selecionar plano '${dados_yaml["plano"]}'

    Capturar tela    price selecionado
    Clicar em seguir para 'Send Quote'