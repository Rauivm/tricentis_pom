*** Settings ***
Library          SeleniumLibrary
Library          ../utils/vehicle_executor.py
Library          ../utils/keywords_pdf.py
Resource         ../flow/vehicle_data_flow.robot
Resource         ../resources/config.robot
Variables        ../resources/vehicle_automobile_data.yaml

Test Template    Criar seguro para o veículo

Suite Setup      Abrir navegador
Suite Teardown        Run Keywords
...    Fechar navegador
...    AND    Criar Pdf De Screenshots    ${OUTPUT DIR}    PDFs/${PREV_TEST_STATUS}/${PREV_TEST_NAME}.pdf    ${PREV_TEST_STATUS}    ${PREV_TEST_NAME}

*** Test Cases ***
CT01 - BMW 15000km
    [Tags]    automobile
    ${vehicle_automobile_data}[0]