from glob import glob
import os
from robot.api.deco import keyword


@keyword("Encontrar arquivo no diretório")
def encontrar_arquivo_no_diretorio(base_path, nome_arquivo):

    padrao = os.path.join(base_path, f"{nome_arquivo}.*")
    arquivos = glob(padrao)

    if not arquivos:
        raise FileNotFoundError(
            f"Nenhum arquivo encontrado para '{nome_arquivo}' em {base_path}"
        )

    # retorna o primeiro encontrado
    return arquivos[0]