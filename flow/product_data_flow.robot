*** Settings ***
Library    ../utils/product_data_generator.py
Resource   ../pages/product_data_page.robot
Resource   ../utils/capturar_page.robot
Resource   ../utils/ui_commands.robot

*** Keywords ***

Preencher dados do produto
    [Arguments]    ${dados_yaml}

    ${produto}=    Gerar dados do produto    ${dados_yaml}

    Informar data de início              ${produto["start_date"]}
    Selecionar valor do seguro           ${produto["insurance_sum"]}
    Selecionar merit rating              ${produto["merit_rating"]}
    Selecionar tipo de dano              ${produto["damage_insurance"]}
    Selecionar produtos opcionais        @{produto["optional_products"]}
    Selecionar carro cortesia            ${produto["courtesy_car"]}

    Capturar tela    product preenchido
    Clicar em seguir para 'Select Price Option'