import pkgutil
import importlib
import domain

from robot.libraries.BuiltIn import BuiltIn
from domain.vehicle_data import VehicleData
from domain.base_vehicle import BaseVehicle


def auto_import_domain_modules():
    for _, module_name, _ in pkgutil.iter_modules(domain.__path__):
        importlib.import_module(f"domain.{module_name}")


auto_import_domain_modules()


def preencher_veiculo(veiculo_dict):

    selenium = BuiltIn()

    data = VehicleData(veiculo_dict)

    vehicle = BaseVehicle.create(
        data.tipo,
        selenium,
        data
    )

    vehicle.fill()