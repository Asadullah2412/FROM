import random

class NPC:
    
    def __init__(self,name,age,hunger,fear,intelligence):
        self.name = name
        self.age = age
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



    def update_hunger_level(self):
        self.hunger += 20

    def check_hunger_level(self):

        if self.hunger >=80:
            print("Hungry !!! find food")
            return True
        else:
            print("not so hungry")
            return False

    def move(self,location):
        
        if self.check_hunger_level() == False:     
        
            self.intelligence += location.knowledge_value
            self.search_clue(location=location)
            self.fear += location.danger # update this 
            self.hunger -= location.food_supply
        
            print(f'{self.name} is currently in {location.name}')
            print(f'{self.name} has examined the loaction and have found these many clues {len(self.clues)}')

    
    
        

        
# dummy for test
npc1 = NPC(name='npc1',age='27',hunger=20,fear=40,intelligence=20)
npc2 = NPC(name='npc2',age='57',hunger=50,fear=10,intelligence=50)
npc3 = NPC(name='npc3',age='37',hunger=10,fear=30,intelligence=40)
npc4 = NPC(name='npc4',age='17',hunger=20,fear=30,intelligence=10)
npc5 = NPC(name='npc5',age='47',hunger=30,fear=10,intelligence=5)


characters = [npc1,npc2,npc3,npc4,npc5]