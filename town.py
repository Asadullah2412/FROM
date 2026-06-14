from model.place import locations
from model.npc import characters


# print('all the locations in the town ')

# for location in locations:
#     location.speak()



# print('characters in the town')

# for character in characters:
#     character.introduce()



eg1 = characters[0]

eg1.move(location=locations[0])
eg1.move(location=locations[1])



