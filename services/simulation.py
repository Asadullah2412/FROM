
from engine.location import create_locations
from engine.npc import create_characters
from engine.world import world
from engine.monster import Monster, create_monster
# import random
# from engine.town import w1


#  town is used to  start , store simulation 
simulation_events = {}

simulation_active = False
w1 = None



def create_world():

    new_world = world(
        # day=1,
        isDay=True
    )

    new_world.add_predefined_npcs_locations_monsters(
        npcs=create_characters(),
        locations=create_locations(),
        
        # monsters=Monster(name='monster',agression=90,strength=80,fear_Aura=100)
        monsters=create_monster()
    )

    return new_world


def start_simulation():

    global simulation_active, w1

    if simulation_active:
        return {
            "status": "error",
            "message": "Simulation already running. Reset first."
        }


    simulation_active = True


    w1 = create_world()


    simulation_events = {}

    for day in range(10):

        result = w1.run_day()

        simulation_events[day] = result


        if result["ending"] == "game over":
            break

        if result["ending"] == "escape":
            break


    return simulation_events


def reset_simulation():

    global simulation_active, w1

    simulation_active = False
    w1 = None


    return {
        "status":"reset",
        "message":"Simulation reset successfully"
    }


# def start_simulation():

#     w1 = world(isDay=True)

#     w1.add_predefined_npcs_locations_monsters(
#         npcs=characters,
#         locations=locations,
#         monsters=monster
#     )

#     simulation_event = {}

#     for day in range(10):

#         result = w1.run_day()

#         simulation_event[day] = result

#         if result["ending"] == "game over":
#             break

#         elif result["ending"] == "escape":
#             break

#     return simulation_event