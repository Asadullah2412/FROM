# world = base crust of a pizza 
# verry important

from model.npc import NPC
from model.place import Location
class world:

    def __init__(self,day,isDay):
        self.day =day
        self.isDay = isDay
        self.events = []
        self.npcs = []
        self.monster =[] # adding this later
        self.locations = []
        self.global_clues = 20
        self.discovered_clues = []


    def get_discovered_clues(self,npc):

        if len(npc.clues) == 0:
            print(f"this {npc.name} has no clues ")
        else:
            self.discovered_clues.extend(npc.clues)
        
        return self.discovered_clues

    def escape_status(self):
        if len(self.discovered_clues) == self.global_clues:
            print('Escaped')
            return True
        else:
            print('Need to find more clues')
            return False

    def run_day(self):

        # 1. Print current day
        print(f"current day is {self.day}")

        # 2. Loop through NPCs
        for npc in self.npcs:
            npc.act(self.locations) # 3. NPC moves , 5. NPC updates stats
            self.get_discovered_clues(npc) #6 update discoverd clues

        #7. check escape status
        if self.escape_status() == True:
            print("HURRAY!!!!")
        else:

            # 8. Advance time
            self.advance_time()
            self.day += 1


        print(f"current day is {self.day}")


    def advance_time(self):

        if self.isDay == True:
            self.isDay = False
            print(f"it was day now its night")
        else:
            self.isDay = True
            print(f"it was night now its day")

    
    def add_predefined_npcs_locations(self,npcs,locations):
        self.npcs.extend(npcs)
        self.locations.extend(locations)

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

        new_location = Location(clue= location_clue,intelligence=location_intelligence,fear=location_Fear,hunger=location_hunger,name=location_name)

        if new_location in self.locations:
            print("Location already exists")
        else:
            self.locations.append(new_location)


    def display_world_content(self):

        print(f"players are {len(self.npcs)}")
        print(f"monster are {self.monster}")
        print(f"Locations are {self.locations}")
        print(f'the events which occured are {self.events}')
        print(f'escape status = {len(self.discovered_clues)} / {self.global_clues}')

    
    def log_event(self,new_event):
        self.events.append(new_event)

