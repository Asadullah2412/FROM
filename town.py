from model.place import locations,Location
from model.npc import characters,NPC
from world.engine import world
from model.monster import monster
import random





# print('all the locations in the town ')

# for location in locations:
#     location.speak()



# print('characters in the town')

# for character in characters:
#     character.introduce()


# ch1 = characters[1]


# for location in locations:

#     # ch1.move(location=location)
#     for charcter in characters:
#         charcter.move(location=location)



# for character in characters:
#     character.move(location=locations[2])
#     character.move(location=random.choice(locations))




# n1 = characters[4]

# for i  in range(5) :
#     print('day',i)
#     n1.move(location=random.choice(locations))

# print(n1.stats())


# isDay testing

# from world.engine import world

# w1 = world(day=1,isDay=False)

# # w1.advance_time()

# # w1.add_npc() # add npc test

# w1.add_location()
# w1.display_world_content() 

# print(w1.locations)

# location testing ahead ⚠️⚠️⚠️

# l1 = Location(name='Home',danger=75,knowledge_value=27,food_supply=38,clues=[1,2,3])

# l1.add_neighbors(new_neighbors=['left','right','back','center'])
# print(">>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<")
# clue_random = l1.get_random_clue()
# print(clue_random)
# print("_____________________________________")
# n1 = l1.get_neighbors()
# print(n1)
# # print(">>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<")
# l1.is_dangerous()
# print(">>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<")
# l1.show_location_info()


# NPC hunger method test ahead ⚠️⚠️

# loc1 = locations[0]

# n1 = NPC(name='lala',age=18,hunger=10,fear=10,intelligence=45)

# # n1.move(location=loc1)
# # n1.stats()
# # print("before")
# # n1.rest()
# # print("after")

# n1.act(locations=locations)
# n1.stats()

# world testing ⚠️⚠️⚠️

w1 = world(day=1,isDay=True)
# w1.npcs.extend(characters)
# w1.locations.extend(locations)

w1.add_predefined_npcs_locations_monsters(npcs=characters,locations=locations,monsters=monster)

for i in range(4):

    w1.run_day()

# w1.display_world_content()



# n1.meet_npc(other_npc=n2)


# bug fix remaining  
# Dead NPC cleanup
# Daily location reset
# Duplicate clue sharing
# Duplicate monster 