class location:

    def __init__(self,clue,intelligence,fear,hunger,name):

        self.name =name
        self.clue = clue
        self.intelligence = intelligence
        self.fear = fear
        self.hunger =hunger
        
    def speak(self):

        print(f'created {self.name} ')


