*** Settings ***
Resource    ../resources/locators_vehicle.robot
Resource    ../resources/locators_globais.robot
Library    String

*** Keywords ***
Selecionar '${vehicle}' no menu de navegação
    ${elemento}    Replace String    ${nav_vehicle}    {vehicle}    ${vehicle}
    Click Element    ${elemento}

Selecionar marca do veículo
    [Arguments]    ${marca}
    Select From List By Label    ${MAKE_SELECT}    ${marca}

Selecionar modelo do veículo
    [Arguments]    ${modelo}
    Select From List By Label    ${MODEL_SELECT}    ${modelo}

Informar cilindrada
    [Arguments]    ${cilindrada}
    Input Text    ${CYLINDER_INPUT}    ${cilindrada}

Informar potência do motor
    [Arguments]    ${potencia}
    Input Text    ${ENGINE_INPUT}    ${potencia}

Informar data de fabricação
    [Arguments]    ${data}
    Input Text    ${DATE_INPUT}    ${data}

Selecionar número de assentos
    [Arguments]    ${assentos} 
    Select From List By Label    ${SEATS_SELECT}    ${assentos}

Selecionar tipo de combustível
    [Arguments]    ${combustivel}
    Select From List By Label    ${FUEL_SELECT}    ${combustivel}

Informar preço de tabela
    [Arguments]    ${preco}
    Input Text    ${PRICE_INPUT}    ${preco}

Informar placa
    [Arguments]    ${placa}
    Input Text    ${PLATE_INPUT}    ${placa}

Informar quilometragem anual
    [Arguments]    ${km}
    Input Text    ${KM_INPUT}    ${km}