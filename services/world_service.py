
from engine.town import w1


def get_names(obj_list):
    names = []
    for npc in obj_list:

        names.append(npc.name)
    
    return names

npc_names = get_names(obj_list=w1.npcs)
monster_names = get_names(obj_list=w1.monsters)
location_names = get_names(obj_list=w1.locations)




def world_details():

    return {
        'npcs' : npc_names,
        'monsters' : monster_names,
        'locations' : location_names,
        'events' : w1.events,
        'escape stauts' : f'{len(w1.discovered_clues)} / {w1.global_clues}',
        # 'map' : w1.s_town_map
    }






