*** Settings ***
Resource    ../pages/vehicle_data_page.robot

*** Keywords ***
Preencher motorcycle
    [Arguments]    ${veiculo}

    Selecionar marca do veículo        ${veiculo.marca}
    Selecionar modelo do veículo       ${veiculo.modelo}
    Informar cilindrada                ${veiculo.cilindrada}
    Informar potência do motor         ${veiculo.potencia}
    Informar data de fabricação        ${veiculo.data}
    Selecionar número de assentos      ${veiculo.assentos}
    Informar preço de tabela           ${veiculo.preco}
    Informar quilometragem anual       ${veiculo.km}