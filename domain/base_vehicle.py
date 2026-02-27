class BaseVehicle:

    registry = {}

    @classmethod
    def register(cls, vehicle_type):
        def decorator(subclass):
            cls.registry[vehicle_type] = subclass
            return subclass
        return decorator

    @classmethod
    def create(cls, vehicle_type, selenium, data):
        if vehicle_type not in cls.registry:
            raise Exception(f"Tipo inválido: {vehicle_type}")

        return cls.registry[vehicle_type](selenium, data)

    def __init__(self, selenium, data):
        self.selenium = selenium
        self.data = data

    def fill_common(self):
        self.selenium.run_keyword("Selecionar marca do veículo", self.data.marca)
        self.selenium.run_keyword("Informar potência do motor", self.data.potencia)
        self.selenium.run_keyword("Informar data de fabricação", self.data.data_fabricacao)
        self.selenium.run_keyword("Selecionar número de assentos", self.data.assentos)
        self.selenium.run_keyword("Informar preço de tabela", self.data.preco)
        self.selenium.run_keyword("Informar quilometragem anual", self.data.km)