*** Settings ***
Library          SeleniumLibrary
Library          ../utils/vehicle_executor.py
Resource         ../flow/vehicle_data_flow.robot
Resource         ../resources/config.robot
Variables        ../resources/vehicle_automobile_data.yaml

Test Template    Criar seguro para o veículo

Suite Setup      Abrir navegador
Suite Teardown   Fechar navegador

*** Test Cases ***
CT01 - BMW 15000km
    [Tags]    automobile
    ${vehicle_automobile_data}[0]