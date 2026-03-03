*** Settings ***
Resource    config.robot
Library     OperatingSystem
Library     SeleniumLibrary
Library     ../utils/keywords_pdf.py

*** Keywords ***

Preparar ambiente do teste
    ${RUN_ID}=    Evaluate    __import__('uuid').uuid4().hex
    Set Test Variable    ${RUN_ID}

    ${screenshot_dir}=    Set Variable    ${OUTPUT DIR}/Screenshots/${RUN_ID}
    Create Directory      ${screenshot_dir}

    Abrir navegador
    Set Screenshot Directory    ${screenshot_dir}


Finalizar teste
    Run Keywords
    ...    Run Keyword And Ignore Error    Criar Pdf Organizado
    ...    AND    Fechar navegador


Criar Pdf Organizado
    ${pdf_base_dir}=    Set Variable    ${OUTPUT DIR}/PDFs
    ${status_dir}=      Set Variable    ${pdf_base_dir}/${TEST STATUS}

    Create Directory    ${pdf_base_dir}
    Create Directory    ${status_dir}

    ${nome_pdf}=    Set Variable    ${status_dir}/${TEST NAME}.pdf

    Criar Pdf De Screenshots
    ...    ${OUTPUT DIR}/Screenshots/${RUN_ID}
    ...    ${nome_pdf}
    ...    ${TEST STATUS}
    ...    ${TEST NAME}