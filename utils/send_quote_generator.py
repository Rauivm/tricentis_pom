from robot.api.deco import keyword
from faker import Faker

faker = Faker()

@keyword("Gerar dados para envio de cotação")
def gerar_dados(yaml_data):

    return {
        "email": faker.email(),
        "username": faker.user_name(),
        "password": yaml_data.get("password"),
        "comments": yaml_data.get("comments"),
    }