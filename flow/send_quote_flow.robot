*** Settings ***
Library    ../utils/send_quote_generator.py
Resource   ../pages/send_quote_page.robot
Resource   ../utils/capturar_page.robot

*** Keywords ***

Enviar cotação
    [Arguments]    ${dados_yaml}

    ${dados}=    Gerar dados para envio de cotação    ${dados_yaml}

    Informar email para envio          ${dados["email"]}
    Informar username para envio       ${dados["username"]}
    Informar senha para envio          ${dados["password"]}
    Confirmar senha         ${dados["password"]}
    Informar comentários    ${dados["comments"]}

    Capturar tela    send_quote preenchido
    Clicar em enviar

    Validar envio com sucesso
    Capturar tela    envio sucesso