*** Settings ***
Library          ../utils/selenium_wrapper.py
Resource         capturar_page.robot

*** Keywords ***

Validar campo
    [Arguments]    ${locator}    ${valor_esperado}    ${tipo}

    IF    '${tipo}' == 'select'
        ${valor}=    Get Selected List Label    ${locator}
    ELSE
        ${valor}=    Get Value    ${locator}
    END

    Should Be Equal As Strings    ${valor}    ${valor_esperado}


Inserir arquivo '${nome_do_arquivo}'
    [Arguments]    ${posicao}=1
    # Você deve inserir o nome do campo com o label em tela,
    ## O arquivo deve estar na pasta 'Utils/archives' para funcionar essa keyword
    ## Deve ser informado o tipo do arquivo... .png, .pdf, .jpg, .zip etc.
    # A posição representa a ordem de inputs no html, por exemplo, existem 2 inputs, você deve selecionar o 1 ou 2,
    ## caso o desejado for 2, você deve informar 2 no argumento

    ${elemento}    Replace String    ${xpath_arquivo}    {posicao}    ${posicao}

    # Lista de possíveis arquivos
    ${arquivos}    Create List
    ...    ${EXECDIR}/utils/archives/${nome_do_arquivo}.png
    ...    ${EXECDIR}/utils/archives/${nome_do_arquivo}.jpg
    ...    ${EXECDIR}/utils/archives/${nome_do_arquivo}.pdf
    ...    ${EXECDIR}/utils/archives/${nome_do_arquivo}.csv
    ...    ${EXECDIR}/utils/archives/${nome_do_arquivo}.zip

    ${arquivo_final}    Set Variable    NONE

    FOR    ${arquivo}    IN    @{arquivos}
        ${existe}    Run Keyword And Return Status    File Should Exist    ${arquivo}
        ${arquivo_final}    Set Variable    ${arquivo}
        Run Keyword If    ${existe}    Exit For Loop
    END

    # Agora que temos um caminho válido, selecionamos o arquivo
    Choose File    ${elemento}    ${arquivo_final}
