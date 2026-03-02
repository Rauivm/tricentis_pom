*** Settings ***
Library    ../utils/data_generator.py
Resource   ../utils/ui_commands.robot
Resource   ../pages/insurant_data_page.robot
Resource   ../utils/capturar_page.robot


*** Keywords ***

Preencher dados do segurado
    [Arguments]    ${dados_yaml}

    ${segurado}=    Gerar dados do segurado    ${dados_yaml}

    Informar primeiro nome         ${segurado["nome"]}
    Informar sobrenome             ${segurado["sobrenome"]}
    Informar data de nascimento    ${segurado["data_nascimento"]}
    Selecionar gênero              ${segurado["genero"]}
    
    Informar endereço              ${segurado["endereco"]}
    Selecionar país                ${segurado["pais"]}
    Informar CEP                   ${segurado["cep"]}
    Informar cidade                ${segurado["cidade"]}

    Selecionar ocupação            ${segurado["ocupacao"]}
    Selecionar Hobbies             @{segurado["hobbies"]}
    

    Informar website               ${segurado["website"]}
    
  
    Escolher Foto                  ${segurado["nome_do_arquivo"]}

    Capturar tela    insurant preenchido
    Clicar em seguir para 'Enter Product Data'