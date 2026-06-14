from model.place import locations
from model.npc import characters
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




n1 = characters[4]

for i  in range(5) :
    print('day',i)
    n1.move(location=random.choice(locations))

print(n1.stats())
