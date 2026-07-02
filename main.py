from fastapi import FastAPI

from routers.simulation_router import simulation_router
from routers.world_router import world_router
from routers.npc_router import npc_router
app = FastAPI()

app.include_router(router=simulation_router)
app.include_router(router=world_router)
app.include_router(router=npc_router)