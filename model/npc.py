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

        