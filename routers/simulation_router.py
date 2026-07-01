from fastapi import APIRouter
from services.simulation import start_simulation
simulation_router = APIRouter()

@simulation_router.post('/start_simulation')
def start(days:int):
    return start_simulation(days=days)


