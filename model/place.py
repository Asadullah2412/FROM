class location:

    def __init__(self,clue,intelligence,fear,hunger,name):

        self.name =name
        self.clue = clue
        self.intelligence = intelligence
        self.fear = fear
        self.hunger =hunger
        
    def speak(self):

        print(f'created {self.name} ')





# initializaiton of places
church = location(clue=1,intelligence=10,fear=-10,hunger=-20,name='church')
diner = location(clue=1,intelligence=10,hunger=80,name='diner',fear=10)
colony_house = location(clue=1,intelligence=5,hunger=-40,name='colony house',fear=10)
barn =  location(clue=0,intelligence=5,hunger=-20,name='barn',fear=10)
hospital = location(clue=1,intelligence=10,hunger=-20,name='hospital',fear= -10)
forest = location(clue=1,intelligence=5,hunger=-20,name='forest',fear=40)


locations = [church,diner,colony_house,barn,hospital,forest]
