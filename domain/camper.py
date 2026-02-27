from .base_vehicle import BaseVehicle

@BaseVehicle.register("camper")
class Camper(BaseVehicle):

    def fill(self):
        self.data.require("combustivel", "payload", "peso_total")

        self.fill_common()

        self.selenium.run_keyword(
            "Selecionar tipo de combustível",
            self.data.combustivel
        )

        self.selenium.run_keyword(
            "Informar payload",
            self.data.payload
        )

        self.selenium.run_keyword(
            "Informar peso total",
            self.data.peso_total
        )