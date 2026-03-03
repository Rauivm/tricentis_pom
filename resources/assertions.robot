*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Deve estar visível
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    ${timeout}

Campo deve ter valor
    [Arguments]    ${locator}    ${valor_esperado}    ${tipo}=input

    IF    '${tipo}' == 'select'
        ${valor}=    Get Selected List Label    ${locator}
    ELSE
        ${valor}=    Get Value    ${locator}
    END

    ${valor}=    Evaluate    str(${valor}).strip().lower()
    ${esperado}= Evaluate    str(${valor_esperado}).strip().lower()

    Should Be Equal
    ...    ${valor}
    ...    ${esperado}
    ...    msg=Valor incorreto no campo ${locator}

Mensagem deve conter
    [Arguments]    ${locator}    ${texto}
    ${msg}=    Get Text    ${locator}
    Should Contain    ${msg}    ${texto}

Elemento deve estar selecionado
    [Arguments]    ${locator}
    Element Should Be Selected    ${locator}

Validar campos obrigatórios preenchidos
    [Arguments]    ${step_id}    ${valor_esperado}

    ${locator}=    Replace String    ${step_counter}    {step_id}    ${step_id}

    Wait Until Element Is Visible    ${locator}    5s
    ${valor}=    Get Text    ${locator}

    Should Be Equal As Strings
    ...    ${valor}
    ...    ${valor_esperado}
    ...    msg=Contador do passo ${step_id} incorreto. Esperado: ${valor_esperado}, Obtido: ${valor}