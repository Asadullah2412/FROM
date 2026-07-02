from engine.town import w1
from engine.npc import NPC
from services.world_service import get_names

npc_names = get_names(obj_list=w1.npcs)

def npc_info(npc_number):
    
    return w1.npcs[npc_number].stats()

def add_npc(name,age,fear,intelligence,hunger,trust,health):

        if name in npc_names:
            # print('NPC already exists')
            return 'NPC already exists'
        else:
            npc = NPC(name=name,age=age,fear=fear,
                  intelligence=intelligence,
                  hunger=hunger,trust = trust,
                  health =health)
            
            w1.npcs.append(npc)
            # print('Npc created')
            return npc.stats()
        
        