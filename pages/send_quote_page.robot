*** Settings ***
Resource    ../resources/locators_send_quote.robot
Resource    ../utils/ui_commands.robot

*** Keywords ***

Informar email para envio
    [Arguments]    ${email}
    Input Text    ${email_input}    ${email}

Informar username para envio
    [Arguments]    ${username}
    Input Text    ${username_input}    ${username}

Informar senha para envio
    [Arguments]    ${senha}
    Input Text    ${password_input}    ${senha}

Confirmar senha
    [Arguments]    ${senha}
    Input Text    ${confirm_password}    ${senha}

Informar comentários
    [Arguments]    ${comentario}
    Input Text    ${comments_input}    ${comentario}

Clicar em enviar
    Click Button    ${send_button}

Validar envio com sucesso
    Wait Until Element Is Visible    ${success_modal}    15s