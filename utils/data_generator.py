from faker import Faker
from robot.api.deco import keyword

fake = Faker()
Faker.seed(123)


@keyword("Gerar dados do segurado")
def gerar_dados_segurado(dados_yaml):

    return {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "data_nascimento": fake.date_of_birth(minimum_age=18, maximum_age=65).strftime("%m/%d/%Y"),
        "email": fake.unique.email(),
        "telefone": fake.phone_number(),
        "endereco": fake.street_address(),
        "cidade": fake.city(),
        "cep": fake.postcode(),
        "website": fake.domain_name(),

        "genero": dados_yaml.get("genero"),
        "pais": dados_yaml.get("pais"),
        "hobbies": dados_yaml.get("hobbies"),
        "ocupacao": dados_yaml.get("ocupacao"),
        "nome_do_arquivo": dados_yaml.get("nome_do_arquivo"),
    }