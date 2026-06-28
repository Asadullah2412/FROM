from fastapi import FastAPI

app = FastAPI()


tasks = []

day_tasks = {}


@app.get("/")
def read_root():
    return {"message": "Hello, FastAPI!"}

@app.post('/greet')
def greetUser(name):
    return f'hello , good morning {name}'




@app.get('/tasks')
def showTasks():
    if len(tasks) !=0:
        return tasks
    else:
        return f'No tasks are assingned , please create a task'
    
@app.post('/addTask')
def addTask(task):

    if task != None:
        tasks.append(task)
    else:
        return f'please add a valid task'
    

@app.post('/day_task')
def add_day_task(day,task):

    if task in day_tasks:
        return f'{task} is present in your current tasks'
    else:
        
        day_tasks[day] = task



@app.get('/display_tasks')
def display_tasks():

    if len(day_tasks) != 0:
        return day_tasks
    else:
        return 'You have 0 tasks available'