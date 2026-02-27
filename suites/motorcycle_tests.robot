*** Settings ***
Library          SeleniumLibrary
Library          ../utils/vehicle_executor.py
Library          ../utils/keywords_pdf.py
Resource         ../flow/vehicle_data_flow.robot
Resource         ../resources/config.robot
Variables        ../resources/vehicle_motorcycle_data.yaml

Force Tags    motorcycle

Test Template    Criar seguro para o veículo

Suite Setup      Abrir navegador
Suite Teardown        Run Keywords
...    Fechar navegador
...    AND    Criar Pdf De Screenshots    ${OUTPUT DIR}    PDFs/${PREV_TEST_STATUS}/${PREV_TEST_NAME}.pdf    ${PREV_TEST_STATUS}    ${PREV_TEST_NAME}

*** Test Cases ***
CT02 - Honda 5000km
    [Tags]    motorcycle
    ${vehicle_motorcycle_data}[0]