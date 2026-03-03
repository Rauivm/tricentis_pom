from robot.api.deco import keyword
from reportlab.lib.pagesizes import A4, letter
from reportlab.pdfgen import canvas
from glob import glob
from PIL import Image
import os, shutil
from datetime import datetime
 
def capa(height, c):
    y = height - 15
    page_width = letter[0]

    # image_path = os.path.join("Images", "logo_.jpg")

    image_width = 120  
    image_height = 70
    image_x = (page_width - image_width) / 2  

    y = y - image_height

    # c.drawImage(image_path, image_x, y, width=image_width, height=image_height)

    header_text = "Evidências de Automação"
    subheader_text = "TRICENTIS APP"

    footer_text = """
        Designed by Raui Macedo
        Email: rviana.macedo@gmail.com
    """

    y -= 30

    # Desenha o texto do cabeçalho
    line_width = c.stringWidth(header_text, "Helvetica", 16)
    x = (page_width - line_width) / 2
    c.drawString(x, y, header_text)
    y -= 20

    # Desenha o texto do subcabeçalho (SIAPEN) mais para a esquerda
    line_width = c.stringWidth(subheader_text, "Helvetica", 16)
    x = (page_width - line_width) / 2 - 20  # Ajuste para a esquerda
    c.drawString(x, y, subheader_text)
    y -= 20

    # image_path = os.path.join("Images", "logo_.png")

    image_width = 120
    image_height = 70
    image_x = (page_width - image_width) / 2  
    y = y - image_height - 470

    # c.drawImage(image_path, image_x, y, width=image_width, height=image_height)

    y -= 30

    # Desenha o texto do rodapé mais para a esquerda
    for line in footer_text.strip().split('\n'):
        line = line.strip()
        line_width = c.stringWidth(line, "Helvetica", 10)
        x = (page_width - line_width) / 2 - 20  # Ajuste para a esquerda
        c.drawString(x, y, line)
        y -= 20

    c.showPage()
 
def criar_pasta_para_pdfs(status_test):
    current_directory = os.getcwd()
    os.makedirs(f'{current_directory}/PDFs/{status_test}', exist_ok=True)
   
 
def criar_pastas_para_png(screenshots_dir, test_name, image_paths):
    new_folder = os.path.join(screenshots_dir, test_name)
    os.makedirs(new_folder, exist_ok=True)
 
    for image_path in image_paths:
        shutil.copy2(image_path, os.path.join(new_folder, os.path.basename(image_path)))
        os.remove(image_path)

@keyword("Criar Pdf De Screenshots")
def criar_pdf_de_screenshots(screenshots_dir, output_pdf_path, status_test, test_name, images_per_page=1): 
    criar_pasta_para_pdfs(status_test)
 
    c = canvas.Canvas(output_pdf_path, pagesize=A4)
    width, height = A4
    image_paths = [path for path in glob(os.path.join(screenshots_dir, "*.png")) if "checklist" not in os.path.basename(path)]
    image_paths = sorted(image_paths, key=os.path.getmtime)
    padding = 10
 
    capa(height, c)
   
    num_columns = 1
    num_rows = images_per_page // num_columns
    image_width = width / num_columns
    image_height = height / num_rows
 
    page_number = 1
    page_width = letter[0]
    for i, image_path in enumerate(image_paths):
        c.setFont("Helvetica", 14)
        c.drawString(10, height - 25, f"{test_name}")
 
        c.setStrokeColorRGB(0, 0, 0)  # Define a cor da linha (preto)
        c.setLineWidth(0.5)  # Define a largura da linha
        y = height - 35  # Define a posição y para a linha (meio da página)
        c.line(10, y, page_width - 40, y)  # Desenha a linha horizontal
 
        line = f"{image_path.replace('\\', '/').split('/')[-1]} ({datetime.now().strftime('%d/%m/%Y %H:%M:%S')})"

        c.setFont("Helvetica", 12)

        text_object = c.beginText(40, height - 55)
        max_width = width - 80

        while line:
            for i in range(len(line), 0, -1):
                if c.stringWidth(line[:i], "Helvetica", 12) <= max_width:
                    text_object.textLine(line[:i])
                    line = line[i:]
                    break

        c.drawText(text_object)
        page_number += 1
 
        row = (i // num_columns) % num_rows
        col = i % num_columns
 
        x = col * image_width + (col + 1) * padding
        y = height - (row + 1) * image_height - (row + 1) * padding
 
        with Image.open(image_path) as img:
            img_width, img_height = img.size
            aspect = img_width / img_height

            max_width = width - 80
            max_height = height - 120

            if aspect > 1:
                new_width = max_width
                new_height = max_width / aspect
            else:
                new_height = max_height
                new_width = max_height * aspect

        x_centered = (width - new_width) / 2
        y_centered = (height - new_height) / 2 - 20
       
        c.drawImage(image_path, x_centered, y_centered, new_width, new_height)
        c.showPage()
 
        img.close()
 
    c.save()
 
    criar_pastas_para_png(screenshots_dir, test_name, image_paths)
 
 
def remover_pdf(caminho_pasta, nome_arquivo_pdf):
    """
    Remove um arquivo PDF específico em uma pasta.
 
    :param caminho_pasta: Caminho da pasta onde o arquivo PDF está localizado.
    :param nome_arquivo_pdf: Nome do arquivo PDF a ser removido.
    """
    caminho_arquivo = os.path.join(caminho_pasta, nome_arquivo_pdf)
 
    if os.path.isfile(caminho_arquivo):
        os.remove(caminho_arquivo)