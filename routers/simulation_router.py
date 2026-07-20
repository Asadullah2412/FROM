from fastapi import APIRouter
from services.simulation import start_simulation , reset_simulation
simulation_router = APIRouter()

@simulation_router.get('/start_simulation')
def start():
    sim_day = start_simulation()
    return sim_day

@simulation_router.get('/reset')
def reset():
    msg = reset_simulation()
    return msg





