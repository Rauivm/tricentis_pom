*** Settings ***
Resource    ../resources/locators_product.robot
Resource    ../resources/locators_globais.robot
Resource    ../utils/ui_commands.robot

*** Keywords ***

Informar data de início
    [Arguments]    ${data}
    Input Text    ${start_date}    ${data}

Selecionar valor do seguro
    [Arguments]    ${valor}
    Select From List By Label    ${insurance_sum}    ${valor}

Selecionar merit rating
    [Arguments]    ${rating}
    Select From List By Label    ${merit_rating}    ${rating}

Selecionar tipo de dano
    [Arguments]    ${tipo}
    Select From List By Label    ${damage_insurance}    ${tipo}

Selecionar produtos opcionais
    [Arguments]    @{produtos}
    FOR    ${p}    IN    @{produtos}
        ${elemento}=    Replace String    ${optional_product_locator}    {description}    ${p}
        Click Element    ${elemento}
    END

Selecionar carro cortesia
    [Arguments]    ${valor}
    Select From List By Label    ${courtesy_car}    ${valor}