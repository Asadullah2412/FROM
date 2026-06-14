class npc:
    
    def __init__(self,name,age,hunger,fear,intelligence,clue):
        self.name = name
        self.age = age
        self.hunger =hunger
        self.fear = fear
        self.intelligence =intelligence
        self.clue =clue
    
    def introduce(self):

        print(f'hi im {self.name} and i have these many clues {self.clue}')

    def stat(self):
        print('npc name : ' ,self.name)
        print('npc age : ',self.age)
        print('npc clue : ',self.clue)
        print('npc Fear : ',self.fear)
        print('npc intelligence : ',self.intelligence)
        print('npc Hunger : ',self.hunger)

    def search_clue(self):

        if self.intelligence >= 60:
            self.clue +=1
        else:
            print('not enough intelligence')
            

    def move(self,location):
        # location_name = location.name
        # self.clue += location.clue  # add search function here 
        self.intelligence += location.intelligence
        self.search_clue()
        self.fear += location.fear
        self.hunger += location.hunger
        
        print(f'{self.name} is currently in {location.name}')
        print(f'{self.name} has these clues {self.clue}')

    
    
        

        

npc1 = npc(name='npc1',age='27',hunger=20,fear=40,intelligence=20,clue=0)
npc2 = npc(name='npc2',age='57',hunger=50,fear=10,intelligence=50,clue=0)
npc3 = npc(name='npc3',age='37',hunger=10,fear=30,intelligence=40,clue=0)
npc4 = npc(name='npc4',age='17',hunger=20,fear=30,intelligence=10,clue=0)
npc5 = npc(name='npc5',age='47',hunger=30,fear=10,intelligence=5,clue=0)


characters = [npc1,npc2,npc3,npc4,npc5]