from model.place import locations
from model.npc import characters


# print('all the locations in the town ')

# for location in locations:
#     location.speak()



# print('characters in the town')

# for character in characters:
#     character.introduce()


ch1 = characters[1]


for location in locations:

    # ch1.move(location=location)
    for charcter in characters:
        charcter.move(location=location)




