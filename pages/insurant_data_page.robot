*** Settings ***
Library    ../utils/data_generator.py
Library    String
Library    SeleniumLibrary
Resource   ../pages/insurant_data_page.robot
Resource   ../resources/locators_insurant.robot
Resource    ../resources/locators_globais.robot
Resource   ../utils/ui_commands.robot
*** Keywords ***
Informar primeiro nome
    [Arguments]    ${nome}
    Input Text    ${first_name}    ${nome}
Informar sobrenome
    [Arguments]    ${sobrenome}
    Input Text    ${last_name}     ${sobrenome}
Informar data de nascimento
    [Arguments]    ${data_nascimento}
    Input Text    ${birth_date}    ${data_nascimento}
Informar email
    [Arguments]    ${texto_email}
    Input Text    ${email}        ${texto_email}
Informar telefone
    [Arguments]    ${telefone}
    Input Text    ${phone}        ${telefone}
Informar endereço
    [Arguments]    ${endereco}
    Input Text    ${street_address}    ${endereco}
Selecionar gênero
    [Arguments]    ${genero}
    ${genero_normalizado}=    Convert To Lowercase    ${genero}
    ${elemento}=   Replace String    ${gender}    {description}    ${genero_normalizado}
    Click Element    ${elemento}
Selecionar ocupação
    [Arguments]    ${ocupacao}
    Select From List By Label    ${occupation}    ${ocupacao}
Selecionar país
    [Arguments]    ${pais}
    Select From List By Label    ${country}    ${pais}

Informar website
    [Arguments]    ${texto_website}
    Input Text    ${website}    ${texto_website}

Informar cidade
    [Arguments]    ${cidade}
    Input Text    ${city}    ${cidade}

Informar CEP
    [Arguments]    ${cep}
    Input Text    ${zip_code}    ${cep}
Clicar em seguir para dados do produto
    Click Button    ${next_button}

Escolher Foto
    [Arguments]    ${nome_do_arquivo}
    #Click Button    ${choose_file}
    Inserir arquivo '${nome_do_arquivo}'

Selecionar Hobbies
    [Arguments]    @{lista_hobbies}
    FOR    ${hobby}    IN    @{lista_hobbies}
       ${elemento}=   Replace String    ${hobbies}    {description}    ${hobby}
       Click Element    ${elemento}
    END