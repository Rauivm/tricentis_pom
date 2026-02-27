*** Settings ***
Library     selenium_wrapper.py

*** variables ***

${GRAVA_TELAS}             ${true}
${num_captura_tela}        ${0}

*** Keywords ***

Capturar tela
    [Arguments]  ${argNomeEtapa}
    ${nomeArquivoTela}=    Set Variable    NONE

    IF    ${GRAVA_TELAS}
        ${uuid}=    Evaluate    str(uuid.uuid4())    modules=uuid
        ${inc}=     Evaluate    ${num_captura_tela} + 1
        Set Global Variable    ${num_captura_tela}    ${inc}

        ${nomeArquivoTela}=    Set Variable
        ...    ${inc}_${argNomeEtapa}_${uuid}.png

        Capture Page Screenshot    ${nomeArquivoTela}
    END

    RETURN    ${nomeArquivoTela}