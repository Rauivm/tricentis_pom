*** Variables ***

${BASE_URL}    https://sampleapp.tricentis.com/101/app.php
${BROWSER}     chrome

*** Keywords ***

Abrir navegador
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

Fechar navegador
    Close Browser