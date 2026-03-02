from datetime import datetime, timedelta
from robot.api.deco import keyword


@keyword("Gerar dados do produto")
def gerar_dados(yaml_data):

    offset = yaml_data.get("start_date_offset_days", 5)
    start_date = (datetime.now() + timedelta(days=60)).strftime("%m/%d/%Y")

    return {
        "start_date": start_date,
        "insurance_sum": yaml_data.get("insurance_sum"),
        "merit_rating": yaml_data.get("merit_rating"),
        "damage_insurance": yaml_data.get("damage_insurance"),
        "optional_products": yaml_data.get("optional_products", []),
        "courtesy_car": yaml_data.get("courtesy_car"),
    }