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

    def move(self,location):
        location_name = location.name
        self.clue += location.clue
        
        print(f'{self.name} is currently in {location_name}')
        print(f'{self.name} has these clues {self.clue}')
        

        

npc1 = npc(name='npc1',age='27',hunger=20,fear=40,intelligence=20,clue=0)
npc2 = npc(name='npc2',age='57',hunger=50,fear=10,intelligence=50,clue=0)
npc3 = npc(name='npc3',age='37',hunger=10,fear=30,intelligence=40,clue=0)
npc4 = npc(name='npc4',age='17',hunger=20,fear=30,intelligence=10,clue=0)
npc5 = npc(name='npc5',age='47',hunger=30,fear=10,intelligence=5,clue=0)


characters = [npc1,npc2,npc3,npc4,npc5]