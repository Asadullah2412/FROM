import random

class NPC:
    
    def __init__(self,name,age,hunger,fear,intelligence,trust):
        self.name = name
        self.age = age
        self.trust = trust
        self.hunger =hunger
        self.fear = fear
        self.intelligence =intelligence
        self.clues = []
    
    def __repr__(self):

        return self.name
    
    def introduce(self):

        print(f'hi im {self.name} and i have these many clues {self.clues}')

    def stats(self):
        print('npc name : ' ,self.name)
        print('npc age : ',self.age)
        print('npc clue : ',self.clues)
        print('npc Fear : ',self.fear)
        print('npc intelligence : ',self.intelligence)
        print('npc Hunger : ',self.hunger)

    def search_clue(self,location):
        if random.random() < (self.intelligence/100):
            clue =random.choice(location.clues)
            print(f"{self.name} found {clue}")

            if clue not in self.clues:
                self.clues.append(clue)
            else:
                print(f'{self.name} already knows this clue')
        else:
            print(f'{self.name} failed to find anything in {location.name}')
            self.fear +=20






# share_clue()
    def share_clues(self,other_npc):

        other_npc.clues.extend(self.clues)

# increase_trust()
    def increase_trust(self):
        
        self.trust +=30
# decrease_trust()

    def decrease_trust(self):
        self.trust -=10



#     meet_npc()
    def meet_npc(self,other_npc):
        
        for npc in other_npc:
            if npc.trust >=30:
                self.share_clues(other_npc=npc)
                self.increase_trust()
                npc.increase_trust()
                print(f"{self.name} has shared clues with {npc.name}")
            else:
                print(f"{self.name} does not trust {npc.name}")

        # if self.trust >= 30:
        #     self.share_clues(other_npc=other_npc)
        #     self.increase_trust()
        #     print(f"{self.name} has shared clues with {other_npc.name}")
        # else:
        #     print(f"{self.name} does not trust {other_npc.name}")

    
    def update_hunger_level(self):
        self.hunger += 20

    def check_hunger_level(self):

        if self.hunger >=80:
            # print("Hungry !!! find food")
            # self.rest()
            return True
        else:
            # print("not so hungry")
            return False

    def update_fear(self,location):

        self.fear += (location.danger // 10)
        return self.fear

    def rest(self):

        self.hunger = 10
        self.fear -=30



    def move(self,location):
           
        print(f'{self.name} is currently in {location.name}')
        
        self.intelligence += location.knowledge_value
        self.search_clue(location=location)
        self.fear += self.update_fear(location)
        self.hunger -= location.food_supply
    
        print(f'{self.name} has examined the loaction and have found these many clues {len(self.clues)}')


    def act(self,location):
        
        if self.check_hunger_level() == False:
            
            self.move(location=location)
            
        else:
            self.rest()


        

        

        
# dummy for test
npc1 = NPC(name='npc1',trust=40,age='27',hunger=20,fear=40,intelligence=20)
npc2 = NPC(name='npc2',trust=10,age='57',hunger=50,fear=10,intelligence=50)
npc3 = NPC(name='npc3',trust=60,age='37',hunger=10,fear=30,intelligence=40)
npc4 = NPC(name='npc4',trust=30,age='17',hunger=20,fear=30,intelligence=10)
npc5 = NPC(name='npc5',trust=80,age='47',hunger=30,fear=10,intelligence=50)


characters = [npc1,npc2,npc3,npc4,npc5]