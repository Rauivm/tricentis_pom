*** Settings ***
#Libaries
Library          SeleniumLibrary
Library          ../utils/vehicle_executor.py
Library          ../utils/keywords_pdf.py

#Resources
Resource         ../flow/vehicle_data_flow.robot
Resource         ../flow/insurant_data_flow.robot
Resource         ../resources/config.robot
Resource         ../flow/product_data_flow.robot
Resource         ../flow/select_price_flow.robot
Resource     ../flow/send_quote_flow.robot

#Variables
Variables        ../resources/vehicle_automobile_data.yaml
Variables        ../resources/insurant_data.yaml
Variables        ../resources/product_data.yaml
Variables        ../resources/price_option.yaml
Variables        ../resources/send_quote.yaml



#Test Template    Criar seguro para o veículo

Suite Setup      Abrir navegador
Suite Teardown        Run Keywords
...    Fechar navegador
...    AND    Criar Pdf De Screenshots    ${OUTPUT DIR}    PDFs/${PREV_TEST_STATUS}/${PREV_TEST_NAME}.pdf    ${PREV_TEST_STATUS}    ${PREV_TEST_NAME}

*** Test Cases ***
CT01 - BMW 15000km
    [Tags]    automobile
    Criar seguro para o veículo          ${vehicle_automobile_data}[0]
    Preencher dados do segurado          ${insurant_data}[0]
    Preencher dados do produto           ${product_data}[0]
    Selecionar opção de preço            ${price_option}[0]
    Enviar cotação                       ${send_quote}[0]