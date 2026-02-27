from .base_vehicle import BaseVehicle

@BaseVehicle.register("automobile")
class Automobile(BaseVehicle):

    def fill(self):
        self.data.require("combustivel")

        self.fill_common()

        self.selenium.run_keyword(
            "Selecionar tipo de combustível",
            self.data.combustivel
        )

        self.selenium.run_keyword(
            "Informar placa",
            self.data.placa
        )
