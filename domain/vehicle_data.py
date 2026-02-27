class VehicleData:

    def __init__(self, data_dict):
        for key, value in data_dict.items():
            setattr(self, key, value)

    def require(self, field):
        if not hasattr(self, field) or getattr(self, field) is None:
            raise Exception(f"Campo obrigatório ausente: {field}")