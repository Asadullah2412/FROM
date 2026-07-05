from fastapi import APIRouter
from services.simulation import start_simulation
simulation_router = APIRouter()

@simulation_router.post('/start_simulation')
def start(days:int):
    sim_day = start_simulation(days=days)
    return sim_day[1]




