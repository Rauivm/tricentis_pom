*** Settings ***
Resource    ../resources/locators_price.robot
Resource    ../utils/ui_commands.robot

*** Keywords ***

Selecionar plano '${plano}'

    ${plano_lower}=    Convert To Lowercase    ${plano}

    ${elemento}=    Replace String
    ...    ${price_plan_locator}
    ...    {plan}
    ...    ${plano_lower}

    Scroll Element Into View    ${elemento}
    Click Element               ${elemento}

