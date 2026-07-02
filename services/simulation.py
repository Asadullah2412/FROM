
from engine.place import locations,Location
from engine.npc import characters,NPC
from engine.world import world
from engine.monster import monster
import random
from engine.town import w1


#  town is used to  start , store simulation 


def start_simulation(days):
    result = []
    if days > 0:

        for day in range(1,days+1):

            # print(w1.run_day())
            result.append(w1.run_day())
            
    else:
        return {'error' : "days should be greater than 0"}
    
    return result



