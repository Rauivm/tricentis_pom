from .base_vehicle import BaseVehicle

@BaseVehicle.register("motorcycle")
class Motorcycle(BaseVehicle):

    def fill(self):
        self.fill_common()
        
        self.selenium.run_keyword(
            "Informar cilindrada",
            self.data.cilindrada
        )