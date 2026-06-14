from model.place import location
from model.npc import npc

# initializaiton of places
church = location(clue=1,intelligence=10,fear=-10,hunger=-20,name='church')
diner = location(clue=1,intelligence=10,hunger=80,name='diner',fear=10)
colony_house = location(clue=1,intelligence=5,hunger=-40,name='colony house',fear=10)
barn =  location(clue=0,intelligence=5,hunger=-20,name='barn',fear=10)
hospital = location(clue=1,intelligence=10,hunger=-20,name='hospital',fear= -10)
forest = location(clue=1,intelligence=5,hunger=-20,name='forest',fear=40)


# fisrt run
church.speak()
diner.speak()
colony_house.speak()
barn.speak()
hospital.speak()
forest.speak()


