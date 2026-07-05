# world = base crust of a pizza 
# verry important


# {
#     "day": 5,
#     "is_day": True,

#     "escape": {
#         "found": 12,
#         "required": 20
#     },

#     "monster": {
#         "location": "church",
#         "victims": ["npc2", "npc5"]
#     },

#     "npcs": [
#         {
#             "name": "npc1",
#             "health": 90,
#             "fear": 30,
#             "location": "forest",
#             "clues": 3
#         },
#         {
#             "name": "npc2",
#             "health": 40,
#             "fear": 95,
#             "location": "church",
#             "clues": 5
#         }
#     ],

#     "locations": [
#         {
#             "name": "church",
#             "danger": 50
#         },
#         {
#             "name": "forest",
#             "danger": 80
#         }
#     ]
# }

# this is how you have to return 














import copy
import random
import json

from engine.npc import NPC
from engine.place import Location
class world:

    def __init__(self,day,isDay):
        self.day =day
        self.isDay = isDay
        self.events = {}
        self.npcs = []
        self.monsters = [] # adding this later
        self.locations = []
        self.global_clues = 20
        self.discovered_clues = []
        self.town_map = {}
        self.s_town_map = []
        
        self.dead_npc = []


    def get_discovered_clues(self,npc):

        if len(npc.clues) == 0:
            # print(f"this {npc.name} has no clues ")
            f"this {npc.name} has no clues "


        else:
            for clue in npc.clues:

                if clue in self.discovered_clues:
                    return self.discovered_clues
                else:
                    return self.discovered_clues.append(clue)



    def escape_status(self):
        if len(self.discovered_clues) == self.global_clues:
            # print('Escaped')
            return True
        else:
            # print('Need to find more clues')
            return False



    def location_npc_check(self,current_location,npc):
        if len(self.town_map[current_location.name]) > 1:

            other_npcs = [other for other in self.town_map[current_location.name] if other != npc]
            action = npc.meet_npc(other_npcs)
            return action
        else:
            return f'{npc.name} does not have anyone in the {current_location} to share clues or collect clues'

    def serialize_town_map(self):
        return {
            location: [npc.name for npc in npcs]
            for location, npcs in self.town_map.items()
        }


    def run_day(self):

        # 1. Print current day
        # print(f"current day is {self.day}")
        self.town_map.clear()
        self.monsters[0].actions = []
        # self.events.clear()
        # 2. Loop through NPCs

        for npc in self.npcs:

            if npc.is_dead == False:
                npc.actions = []
                current_location = random.choice(self.locations)
                
                if current_location.name in self.town_map:
                    self.town_map[current_location.name].append(npc)
                else:
                    self.town_map[current_location.name] = [npc]
                

                npc_actions  = npc.act(current_location) # 3. NPC moves , 5. NPC updates stats
                npc_actions.append(self.location_npc_check(current_location=current_location,npc=npc))
                self.log_event(day=self.day,new_event=npc_actions,event_type='npc_actions')
                self.get_discovered_clues(npc) #6 update discoverd clues
                
            else:
                self.dead_npc.append(npc.name)
                print(self.dead_npc)
                self.npcs.remove(npc)

        # self.monsters.action = []
        monster_action = self.monsters[0].hunt(self.town_map)
        # print(monster_action)
        self.log_event(day=self.day,new_event=monster_action,event_type='monster_actions')
        #  xx monster hunts 
            

        #7. check escape status
        self.s_town_map = self.serialize_town_map()
        # self.log_event(day= self.day,new_event=self.s_town_map)
        # self.log_event(day=self.day,new_event={'dead_npc':self.dead_npc})
        # snap = self.snapshot(day=self.day)
        if self.escape_status() == True:
            print("HURRAY!!!!")
        else:
            # 8. Advance time


            self.advance_time()
            
            self.day += 1

        return self.events


    def advance_time(self):

        if self.isDay == True:
            self.isDay = False
            # print(f"it was day now its night")
            return self.isDay
        else:
            self.isDay = True
            return self.isDay
            # print(f"it was night now its day")

    
    def add_predefined_npcs_locations_monsters(self,npcs,locations,monsters):
        self.npcs.extend(npcs)
        self.locations.extend(locations)

        # if len(monsters) > 1:
# 
            # self.monsters.extend(monsters)
        # else:


        self.monsters.append(monsters) # duct tape fix later once you decide the num of monsters 


    # ⚠️⚠️⚠️⚠️⚠️⚠️⚠️

    # could use add monster 

    def add_location(self):

        location_name = input("Enter the name >>> ")
        location_clue = input("Enter clues separated by commas >>> ").split(",")
        location_hunger =  int(input("Enter hunger >>> "))
        location_intelligence =  int(input("Enter intelligence >>> "))
        location_Fear =  int(input("Enter Fear >>> "))

        new_location = Location(clue= location_clue,intelligence=location_intelligence,fear=location_Fear,hunger=location_hunger,name=location_name)

        if new_location in self.locations:
            print("Location already exists")
        else:
            self.locations.append(new_location)


    def display_world_content(self):

        print(f"players are {len(self.npcs)}")
        print(f"monster are {self.monsters}")
        print(f"Locations are {self.locations}")
        print(f'the events which occured are {self.events}')
        print(f'escape status = {len(self.discovered_clues)} / {self.global_clues}')
        print(f'The map of town is {self.town_map}')

    
    # def log_event(self,day,new_event, action_name):

    #     if day not in self.events:
    #         if action_name == 'npc_actions':

    #             self.events[day]['npc_actions'].extend(new_event)
    #         else:
    #             self.events[day]['monster_action'].extend(new_event)
    #     # else:
    #     #     self.events[day] = {'npc_actions' :new_event}
    #     #     self.events[day] = {'npc_actions' :[]}

    def log_event(self, day, event_type, new_event):

        if day not in self.events:
            self.events[day] = {
                'npc_actions': [],
                'monster_actions': []
            }

        self.events[day][event_type].extend(new_event)



    def snapshot(self,day):
        snapshot = {
        "npcs": self.npcs,
        "town_map": self.s_town_map,
        "dead_npcs": self.dead_npc,
     "escape_progress": f'{len(self.discovered_clues)} / {self.global_clues}',
        # "time": self.time
            }
        return snapshot
        
