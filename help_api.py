from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()


tasks = []

day_tasks = {}

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Adjust this in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# @app.get("/")
# def read_root():
#     return {"message": "Hello, FastAPI!"}

@app.get('/greet')
def greetUser():
    return {"message": "Hello from FastAPI!"}




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