*** Settings ***
Resource    ../pages/vehicle_data_page.robot

*** Keywords ***
Preencher automobile
    [Arguments]    ${veiculo}

    Selecionar marca do veículo        ${veiculo.marca}
    Informar potência do motor         ${veiculo.potencia}
    Informar data de fabricação        ${veiculo.data}
    Selecionar número de assentos      ${veiculo.assentos}
    Selecionar tipo de combustível     ${veiculo.combustivel}
    Informar preço de tabela           ${veiculo.preco}
    Informar placa                     ${veiculo.placa}
    Informar quilometragem anual       ${veiculo.km}