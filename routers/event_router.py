from fastapi import APIRouter
from services.event_service import next_day,skip_day


event_router = APIRouter()

@event_router.post('/NextDay')
def NextDay(currentday:int):
    return next_day(current_day=currentday)


@event_router.post('/SkipDay')
def SkipDay(day:int):
    return skip_day(day=day)