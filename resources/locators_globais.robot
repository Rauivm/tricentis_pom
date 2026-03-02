*** Variables ***
${nav_vehicle}           //*[@id="nav_{vehicle}"]
${insurance_selected}    //*[@id="selectedinsurance"]

#XPATH PARA O ARQUIVO NA PASTA ARCHIVES
${xpath_arquivo}=        (//input[@type="file"])[{posicao}]

${choose_file}           //*[@id="open"]

#BOTÃO PARA AVANÇAR PÁGINA
${next_button}    xpath=//button[@id="next{page}"]
