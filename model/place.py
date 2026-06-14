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
church = location(clue=['A broken stained glass window showing a symbol pointing underground',
'A journal page: They come after sundown, never before the bell stops'
'Carved into wood: coordinates scratched violently'
'Strange static on an old radio buried near the altar'],intelligence=10,fear=-10,hunger=-20,name='church')


diner = location(clue=['A overheard conversation: someone escaped… but returned changed'
'Receipt with hidden coded message on the back'
'Local map with a route circled multiple times'
'Waitress mentions: Dont trust anyone who knows too much'],intelligence=10,hunger=80,name='diner',fear=10)

colony_house = location(clue=['Old resident list with names crossed out mysteriously',
'Basement note: ‘We tried the tunnel. Only 3 came back.',
'Hidden wall panel with carved tally marks (days trapped)',
'Blueprint of town layout with missing exit route'],intelligence=5,hunger=-40,name='colony house',fear=10)


barn =  location(clue=['Animal behavior log showing livestock panic before disappearances',
'Strange claw marks too large for any known animal',
'Hanging lantern that flickers when someone lies nearby',
'Hidden floorboards revealing buried metal hatch'],intelligence=5,hunger=-20,name='barn',fear=10)


hospital = location(clue=['Patient log mentioning non-human night visitors',
'Emergency radio frequency scribbled on a clipboard',
'Locked room with scratch marks from inside',
'Medical chart showing unexplained repeated injuries at night'],intelligence=10,hunger=-20,name='hospital',fear= -10)


forest = location(clue=['Footprints that appear and vanish suddenly',
'A torn map fragment with missing center section',
'Tree bark carved with repeating warning symbol',
'A compass that always points toward the same hidden direction'],intelligence=5,hunger=-20,name='forest',fear=40)


locations = [church,diner,colony_house,barn,hospital,forest]
