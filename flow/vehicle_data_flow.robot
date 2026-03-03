*** Settings ***
Library    ../utils/vehicle_executor.py
Library    ../utils/selenium_wrapper.py

Resource    ../pages/vehicle_data_page.robot
Resource    ../utils/ui_commands.robot
Resource    ../resources/assertions.robot
*** Keywords ***

Criar seguro para o veículo
    [Arguments]    ${veiculo}
    Selecionar '${veiculo.tipo}' no menu de navegação
    Preencher Veiculo    ${veiculo}
    Validar campos obrigatórios preenchidos    entervehicledata   0
    Capturar tela    dados preenchidos
    Clicar em seguir para 'Enter Insurant Data'
