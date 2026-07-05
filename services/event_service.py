from services.simulation import simulation_events
# next day 


def next_day(current_day):
    if len(simulation_events) > current_day:

        return simulation_events[0][current_day+1]
    elif len(simulation_events) == current_day:
        return 'you are at the last day if simulation'
    else:
        return 'provide a correct day'

def skip_day(day):
    if len(simulation_events) < day:
        return 'please provide a correct value'
    else:

        return simulation_events[0][day]