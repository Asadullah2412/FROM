from fastapi import APIRouter
from services.world_service import world_details

world_router = APIRouter()


@world_router.get('/world_info')
def world_info():
    return world_details()