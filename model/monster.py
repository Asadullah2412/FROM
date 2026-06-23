#  monster class 


#Name
# Location
# Aggression
# Strength
# Fear Aura


class Monster:

    def __init__(self,name,location,agression,strength,fear_Aura):

        self.name = name
        self.location = location
        self.agression = agression
        self.strength = strength
        self.fear_Aura = fear_Aura

    

    def move(self,current_location):
        # 
        print(f"{self.name} is in {current_location}")

        pass 

    def search_npc(self,current_location):
        pass 



