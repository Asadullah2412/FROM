from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from routers.simulation_router import simulation_router
from routers.world_router import world_router
from routers.npc_router import npc_router
from routers.event_router import event_router

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Adjust this in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(router=npc_router)
app.include_router(router=simulation_router)
app.include_router(router=event_router)
app.include_router(router=world_router)