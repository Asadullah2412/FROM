from fastapi import APIRouter
from services.npc_service import npc_info,add_npc

npc_router = APIRouter()

@npc_router.post('/npc_info')
def info_npc(npc_number:int):
    return npc_info(npc_number=npc_number)

@npc_router.post('/add_npc')
def npc_add(name:str,age:int,intelligence:int,hunger:int,fear:int,trust :int,health:int):

    return add_npc(name=name,fear=fear,intelligence=intelligence,
                   hunger=hunger,age=age,trust=trust,health=health)
