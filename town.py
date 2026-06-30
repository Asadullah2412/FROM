from model.place import locations,Location
from model.npc import characters,NPC
from model.engine import world
from model.monster import monster
import random

w1 = world(day=1,isDay=True)
w1.add_predefined_npcs_locations_monsters(npcs=characters,locations=locations,monsters=monster)

#  town is used to  start , store simulation 


def start_simulation(days):

    if days > 0:

        for day in range(1,days+1):

            print(w1.run_day())
    else:
        return {'error' : "days should be greater than 0"}



def  town_info():
    # return w1.
    pass
