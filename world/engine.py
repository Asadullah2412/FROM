# world = base crust of a pizza 
# verry important

from model.npc import NPC
from model.place import location

class world:

    def __init__(self,day,event,isDay):
        self.day =day
        self.event = event
        self.isDay = isDay
        self.npcs = []
        self.monster =[] # adding this later
        self.locations = []

    def run_day(self):
        
        pass 

    def advance_time(self):

        if self.isDay == True:
            self.isDay = False
            print(f"it was day now its {self.isDay}")
        else:
            self.isDay = True
            print(f"it was night now its {self.isDay}")

    
    def add_npc(self):

        npc_name = input('Enter the name >>> ')
        npc_age = int(input("Enter age >>> "))
        npc_hunger =  int(input("Enter hunger >>> "))
        npc_intelligence =  int(input("Enter intelligence >>> "))
        npc_Fear =  int(input("Enter Fear >>> "))

        npc = NPC(name=npc_name,age=npc_age,fear=npc_Fear,intelligence=npc_intelligence,hunger=npc_hunger)

        if npc in self.npcs:
            print('NPC already exists')
        else:
            self.npcs.append(npc)
            print('Npc created')

    def add_location(self):

        location_name = input("Enter the name >>> ")
        location_clue = input("Enter clues separated by commas >>> ").split(",")
        location_hunger =  int(input("Enter hunger >>> "))
        location_intelligence =  int(input("Enter intelligence >>> "))
        location_Fear =  int(input("Enter Fear >>> "))

        new_location = location(clue= location_clue,intelligence=location_intelligence,fear=location_Fear,hunger=location_hunger,name=location_name)

        if new_location in self.locations:
            print("Location already exists")
        else:
            self.locations.append(new_location)

        


    def display_world_content(self):

        print(f"players are {len(self.npcs)}")
        print(f"monster are {self.monster}")
        print(f"Locations are {self.locations}")

