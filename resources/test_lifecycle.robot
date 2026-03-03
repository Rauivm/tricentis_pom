*** Settings ***
Resource    config.robot
Library     OperatingSystem
Library     ../utils/keywords_pdf.py

*** Keywords ***

Preparar ambiente do teste
    ${RUN_ID}=    Evaluate    __import__('uuid').uuid4().hex
    Set Test Variable    ${RUN_ID}
    Create Directory    ${OUTPUT DIR}/Screenshots/${RUN_ID}
    Abrir navegador

Finalizar teste
    Run Keywords
    ...    Fechar navegador
    ...    AND    Criar Pdf De Screenshots
    ...    ${OUTPUT DIR}/Screenshots/${RUN_ID}
    ...    dummy
    ...    ${TEST STATUS}
    ...    ${TEST NAME}