*** Settings ***
#Libaries
Library          SeleniumLibrary
Library          ../utils/vehicle_executor.py


#Resources
Resource         ../flow/vehicle_data_flow.robot
Resource         ../flow/insurant_data_flow.robot
Resource         ../resources/config.robot
Resource         ../flow/product_data_flow.robot
Resource         ../flow/select_price_flow.robot
Resource         ../flow/send_quote_flow.robot
Resource         ../resources/test_lifecycle.robot

#Variables
Variables        ../resources/vehicle_automobile_data.yaml
Variables        ../resources/insurant_data.yaml
Variables        ../resources/product_data.yaml
Variables        ../resources/price_option.yaml
Variables        ../resources/send_quote.yaml

Test Template     Fluxo completo de cotação

Test Setup        Preparar ambiente do teste

Test Teardown     Finalizar teste
*** Keywords ***
Fluxo completo de cotação
    [Arguments]
    ...    ${vehicle}
    ...    ${insurant}
    ...    ${product}
    ...    ${price}
    ...    ${quote}

    Criar seguro para o veículo    ${vehicle}
    Preencher dados do segurado    ${insurant}
    Preencher dados do produto     ${product}
    Selecionar opção de preço      ${price}
    Enviar cotação                 ${quote}

*** Test Cases ***
CT01 - BMW 15000km
    [Tags]    automobile
    ${vehicle_automobile_data}[0]    ${insurant_data}[0]    ${product_data}[0]    ${price_option}[0]    ${send_quote}[0]

CT02 - BMW 30000km
    [Tags]    automobile
    ${vehicle_automobile_data}[1]    ${insurant_data}[0]    ${product_data}[0]    ${price_option}[0]    ${send_quote}[0]