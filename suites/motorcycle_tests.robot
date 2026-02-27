*** Settings ***
Library          SeleniumLibrary
Library          ../utils/vehicle_executor.py
Resource         ../flow/vehicle_data_flow.robot
Resource         ../resources/config.robot
Variables        ../resources/vehicle_motorcycle_data.yaml

Force Tags    motorcycle

Test Template    Criar seguro para o veículo

Suite Setup      Abrir navegador
Suite Teardown   Fechar navegador

*** Test Cases ***
CT02 - Honda 5000km
    [Tags]    motorcycle
    ${vehicle_motorcycle_data}[0]