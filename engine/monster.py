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
        self.actions = []
        

    def __repr__(self):

        return self.name

    

    def spawn(self,town_map):
        # 
        current_location = random.choice(list(town_map))
        # print(f"{self.name} is in {current_location}"
        return current_location
        



    def teleport(self,next_location):
        pass


    def detect_npc(self,town_map,current_location):
        current_npcs = []
        if len(town_map[current_location]) > 0:
            for npc in town_map[current_location]:
                current_npcs.append(npc)
            
            # return current_npcs
                
            # print(f"monster has seen these : {current_npcs}")
            return current_npcs
        else:
            # print("monster has not found anyone")
            return current_npcs

            
    def cause_fear(self,npc):

        if npc.is_dead == True:

            self.victims.add(npc.name)
        
        elif npc.health >=80:
            action = npc.monster_seen(damage= self.strength,fear_aura = self.fear_Aura)
            
        
        else:
            action = npc.monster_seen(damage =(self.strength/4),fear_aura = (self.fear_Aura * 3))
            

        return action
            
        



    def hunt (self,town_map):

        # this decide what monster should do 

        # pre-data
        npcs_at_location = [] 
        # 1. spawn 
        location_choice = self.spawn(town_map=town_map)
        
        # 2. detect npc
        # npcs_at_location.extend(self.detect_npc(town_map=town_map,current_location=location_choice))
        cnpc = self.detect_npc(town_map=town_map,current_location=location_choice)
        # print(cnpc)
        # 3. cause fear 
        for victim in cnpc:

            action = self.cause_fear(victim)
            self.actions.append(action)

        return self.actions

    def display_victims(self):
        return self.victims


# dummy monsters

monster = Monster(name='monster',agression=90,strength=80,fear_Aura=100)
