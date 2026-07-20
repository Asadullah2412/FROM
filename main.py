from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from routers.simulation_router import simulation_router
# from routers.world_router import world_router
# from routers.npc_router import npc_router
from routers.event_router import event_router

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Adjust this in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# app.include_router(router=npc_router)
app.include_router(router=simulation_router)
app.include_router(router=event_router)
# app.include_router(router=world_router)

# uvicorn main:app --reload 
#  to run


# {
#   "current_day": 5,
#   "time_of_day": "Day ☀️",
#   "escape_progress": 0.40,
#   "total_clues_found": 8,
#   "total_clues_needed": 20,
#   "monster_location": "Hospital",
#   "living_npc_count": 10,
#   "dead_npc_count": 0,
  
#   "locations": [
#     {
#       "id": "church",
#       "name": "Church",
#       "npc_count": 1,
#       "occupants": ["npc4"],
#       "has_monster": false,
#       "is_highlighted": false
#     },
#     {
#       "id": "hospital",
#       "name": "Hospital",
#       "npc_count": 2,
#       "occupants": ["npc6", "npc7"],
#       "has_monster": true,
#       "is_highlighted": false
#     }
#   ],

#   "npcs": [
#     {
#       "id": "npc1",
#       "name": "npc1",
#       "status": "alive",
#       "location_name": "Diner",
#       "health": 80,
#       "fear": 40,
#       "trust": 50,
#       "clues_count": 4,
#       "clues_list": [
#         "A journal page: They come after sundown...",
#         "Receipt with hidden coded message"
#       ],
#       "relationships": [
#         {"target_npc": "npc2", "value": 0.6, "stance": "Ally"},
#         {"target_npc": "npc3", "value": 0.4, "stance": "Neutral"}
#       ]
#     }
#   ],

#   "event_logs": [
#     {"day": 5, "time": "08:00", "text": "npc1 found Receipt with hidden coded message on the back at Diner", "type": "clue"},
#     {"day": 5, "time": "09:00", "text": "Monster is in Hospital - npc6 has encountered the monster", "type": "encounter"}
#   ],

#   "monster": {
#     "name": "The Thing",
#     "location_name": "Hospital",
#     "strength": 80,
#     "fear_aura": "High",
#     "victims_today": ["npc6"],
#     "total_encounters": 4
#   }
# }
