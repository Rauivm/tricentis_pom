*** Settings ***
Resource    ../flow/automobile_flow.robot
Resource    ../flow/motorcycle_flow.robot


*** Keywords ***

Executar preenchimento do tipo '${tipo_veiculo}'
    [Arguments]    ${veiculo}

    Run Keyword    Preencher ${tipo_veiculo}    ${veiculo}