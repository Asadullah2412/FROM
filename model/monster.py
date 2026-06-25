#  monster class 


#Name
# Location
# Aggression
# Strength
# Fear Aura

# functions of monster are below
# 
# 1.) spawn 
# 2.) teleport
# 3.) hunt
# 4.) detect_npc
# 5.) appear
# 6.) disappear
# 7.) cause_fear




import random


class Monster:

    def __init__(self,name,agression,strength,fear_Aura):

        self.name = name
        
        self.agression = agression
        self.strength = strength
        self.fear_Aura = fear_Aura
        self.victims = set()

    def __repr__(self):

        return self.name

    

    def spawn(self,town_map):
        # 
        current_location = random.choice(list(town_map))
        print(f"{self.name} is in {current_location}")
        return current_location
        



    def teleport(self,next_location):
        pass


    def detect_npc(self,town_map,current_location):
        current_npc = []
        if len(town_map[current_location]) > 0:
            for npc in town_map[current_location]:
                current_npc.append(npc)
                return current_npc
                #  aftermath add later ryt now print it 
            print(f"monster has seen these : {current_npc}")
        else:
            print("monster has not found anyone")

            
    def cause_fear(self,npc):

        if npc.is_dead == True:
            pass
        
        if npc.health >=80:
            npc.monster_seen(damage= self.strength,fear_aura = self.fear_Aura)
        
        else:
            npc.monster_seen(damage =(self.strength/4),fear_aura = (self.fear_Aura * 3))
            



    def hunt (self,town_map):

        # this decide what monster should do 

        # pre-data 
        # 1. spawn 
        location_choice = self.spawn(town_map=town_map)
        
        # 2. detect npc
        current_npc_at_location = self.detect_npc(town_map=town_map,current_location=location_choice)
        # 3. cause fear 
        for victim in current_npc_at_location:

            self.cause_fear(victim)






# dummy monsters

monster = Monster(name='monster',agression=90,strength=80,fear_Aura=100)
