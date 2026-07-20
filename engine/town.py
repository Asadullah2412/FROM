from engine.location import locations,Location
from engine.npc import characters,NPC
from engine.world import world
from engine.monster import monster
# from monster import monster
# import random

# w1 = world(day=1,isDay=True)
# w1.add_predefined_npcs_locations_monsters(npcs=characters,locations=locations,monsters=monster)

# #  town is used to  start , store simulation 



# def start_simulation(days):
#     sim_events = []
#     if days > 0:

#         for day in range(1,days+1):
#             result = w1.run_day()
#             # sim_events.append(w1.run_day())
#             sim_events.append(result)
#             if result['status'] == "game over":
#                 break
#         return sim_events
#     else:
#         return {'error' : "days should be greater than 0"}



# def  town_info():
#     # return w1.
#     pass


# ⚠️⚠️⚠️⚠️⚠️
# decide later 

# world is defined here 

# w1 = world(day=0,isDay=True)
# w1.add_predefined_npcs_locations_monsters(npcs=characters,locations=locations,monsters=monster)

# sim = start_simulation(days=10)
# print(sim)