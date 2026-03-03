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
    Clicar em seguir para 'Enter Insurant Data'
