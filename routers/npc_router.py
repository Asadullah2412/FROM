from fastapi import APIRouter
from services.npc_service import all_npcs, npc_info,add_npc
# from engine.town import w1

npc_router = APIRouter()

@npc_router.post('/npc_info')
def info_npc(npc_number:int):
    return npc_info(npc_number=npc_number)

@npc_router.post('/add_npc')
def npc_add(name:str,age:int,intelligence:int,hunger:int,fear:int,trust :int,health:int):

    return add_npc(name=name,fear=fear,intelligence=intelligence,
                   hunger=hunger,age=age,trust=trust,health=health)

@npc_router.get('/all_npcs')
def get_all_npcs():
    
    return all_npcs()