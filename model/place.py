import random

class Location:

    def __init__(self,clues,knowledge_value,danger,food_supply,name):

        self.name = name
        self.clues = clues
        self.knowledge_value = knowledge_value
        self.danger = danger
        self.food_supply = food_supply
        self.neighbors = []
    
    def __repr__(self):

        return self.name

        
    def show_location_info(self):

        print(">>>>>>>Location Info <<<<<<<<<<<<<<<<")
        print(f'Location name : {self.name}')
        print(f'Clues : {self.clues}')
        print(f'Knowledge level : {self.knowledge_value}')
        print(f'Fear : {self.danger}')
        print(f'Food supply : {self.food_supply}')




    def get_random_clue(self):

        return random.choice(self.clues)
    

    def add_neighbors(self,new_neighbors):

        self.neighbors.extend(new_neighbors)
        # print(f'{self.name} has these neighbors {self.neighbors}')
        print(f'{self.name} has new neighbours')

    def get_neighbors(self):
        # print(f"Neighbors are {self.neighbors}")
        return self.neighbors

    def is_dangerous(self):
        if self.danger >=60:
            print('>>>>>>> Danger Ahead <<<<<<<')
        else:
            print('>>>>>>>>> Not Dangerous <<<<<<')
    








# initializaiton of places
church = Location(clues=['A broken stained glass window showing a symbol pointing underground',
'A journal page: They come after sundown, never before the bell stops'
'Carved into wood: coordinates scratched violently'
'Strange static on an old radio buried near the altar'],knowledge_value=10,danger=75,food_supply=-20,name='church')


diner = Location(clues=['A overheard conversation: someone escaped… but returned changed',
'Receipt with hidden coded message on the back',
'Local map with a route circled multiple times',
'Waitress mentions: Dont trust anyone who knows too much'],knowledge_value=10,food_supply=80,name='diner',danger=50)

colony_house = Location(clues=['Old resident list with names crossed out mysteriously',
'Basement note: We tried the tunnel. Only 3 came back.',
'Hidden wall panel with carved tally marks (days trapped)',
'Blueprint of town layout with missing exit route'],knowledge_value=5,food_supply=20,name='colony house',danger=80)


barn =  Location(clues=['Animal behavior log showing livestock panic before disappearances',
'Strange claw marks too large for any known animal',
'Hanging lantern that flickers when someone lies nearby',
'Hidden floorboards revealing buried metal hatch'],knowledge_value=5,food_supply=30,name='barn',danger=90)


hospital = Location(clues=['Patient log mentioning non-human night visitors',
'Emergency radio frequency scribbled on a clipboard',
'Locked room with scratch marks from inside',
'Medical chart showing unexplained repeated injuries at night'],knowledge_value=10,food_supply=-20,name='hospital',danger= 10)


forest = Location(clues=['Footprints that appear and vanish suddenly',
'A torn map fragment with missing center section',
'Tree bark carved with repeating warning symbol',
'A compass that always points toward the same hidden direction'],knowledge_value=5,food_supply=-20,name='forest',danger=100)


locations = [church,diner,colony_house,barn,hospital,forest]


