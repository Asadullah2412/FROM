# world = base crust of a pizza 
# verry important



class world:

    def __init__(self,day,event,isDay):
        self.day =day
        self.event = event
        self.isDay = isDay



    def run_day(self):
        
        pass 

    def advance_time(self):

        if self.isDay == True:
            self.isDay = False
            print(f"it was day now its {self.isDay}")
        else:
            self.isDay = True
            print(f"it was night now its {self.isDay}")