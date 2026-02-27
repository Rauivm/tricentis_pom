*** Settings ***
Library    ../utils/vehicle_executor.py
Library    ../utils/selenium_wrapper.py

Resource    ../pages/vehicle_data_page.robot
Resource    ../utils/ui_commands.robot
*** Keywords ***

Criar seguro para o veículo
    [Arguments]    ${veiculo}
    Selecionar '${veiculo.tipo}' no menu de navegação
    Preencher Veiculo    ${veiculo}
    Capturar tela    dados preenchidos
    Clicar em próximo


Criar seguro para '${tipo_veiculo}'
    [Arguments]    ${veiculo}
    Selecionar '${tipo_veiculo}' no menu de navegação
    Executar preenchimento do tipo '${tipo_veiculo}'    ${veiculo}
#    Preencher dados comums do veículo    ${veiculo}
#    Preencher dados específicos do veículo    ${veiculo}
    Capturar tela    dados do veículo preenchidos
    Clicar em próximo




Preencher dados comums do veículo
    [Arguments]    ${veiculo}
    Selecionar marca do veículo        ${veiculo.marca}
    Validar campo    ${MAKE_SELECT}    ${veiculo.marca}    select
    Informar potência do motor         ${veiculo.potencia}
    Validar campo    ${ENGINE_INPUT}    ${veiculo.potencia}    input
    Informar data de fabricação        ${veiculo.data}
    Validar campo    ${DATE_INPUT}    ${veiculo.data}    input
    Selecionar número de assentos      ${veiculo.assentos}
    Validar campo    ${SEATS_SELECT}    ${veiculo.assentos}    select
    Informar preço de tabela           ${veiculo.preco}
    Validar campo    ${PRICE_INPUT}    ${veiculo.preco}    input
    Informar quilometragem anual       ${veiculo.km}
    Validar campo    ${KM_INPUT}    ${veiculo.km}    input

Preencher dados específicos do veículo
    [Arguments]    ${veiculo}
    Informar cilindrada                ${veiculo.cilindrada}
    Validar campo    ${CYLINDER_INPUT}    ${veiculo.cilindrada}    input
    Selecionar tipo de combustível     ${veiculo.combustivel}
    Validar campo    ${FUEL_SELECT}    ${veiculo.combustivel}    select
    Informar placa                     ${veiculo.placa}
    Validar campo    ${PLATE_INPUT}    ${veiculo.placa}    input

Criar seguro com dados do veículo
    [Arguments]    ${veiculo}
    Selecionar 'motorcycle' no menu de navegação
    Selecionar marca do veículo        ${veiculo.marca}
    Validar campo    ${MAKE_SELECT}    ${veiculo.marca}    select
    Selecionar modelo do veículo       ${veiculo.modelo}
    Validar campo    ${MODEL_SELECT}    ${veiculo.modelo}    select
    Informar cilindrada                ${veiculo.cilindrada}
    Validar campo    ${CYLINDER_INPUT}    ${veiculo.cilindrada}    input
    Informar potência do motor         ${veiculo.potencia}
    Validar campo    ${ENGINE_INPUT}    ${veiculo.potencia}    input
    Informar data de fabricação        ${veiculo.data}
    Validar campo    ${DATE_INPUT}    ${veiculo.data}    input
    Selecionar número de assentos      ${veiculo.assentos}
    Validar campo    ${SEATS_SELECT}    ${veiculo.assentos}    select
    Selecionar tipo de combustível     ${veiculo.combustivel}
    Validar campo    ${FUEL_SELECT}    ${veiculo.combustivel}    select
    Informar preço de tabela           ${veiculo.preco}
    Validar campo    ${PRICE_INPUT}    ${veiculo.preco}    input
    Informar placa                     ${veiculo.placa}
    Validar campo    ${PLATE_INPUT}    ${veiculo.placa}    input
    Informar quilometragem anual       ${veiculo.km}
    Validar campo    ${KM_INPUT}    ${veiculo.km}    input
    Capturar tela    dados do veículo preenchidos
    Clicar em próximo