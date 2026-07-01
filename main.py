from fastapi import FastAPI

from routers.simulation_router import simulation_router

app = FastAPI()

app.include_router(router=simulation_router)