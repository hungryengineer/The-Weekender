import random
import time
from turtle import Screen, Turtle
myscreen = Screen()
myscreen.setup(width=600, height=600)
myscreen.bgcolor("black")
myscreen.title("retro_snake_game")
snake = Turtle()
x_y_positions = [(0,0), (-10,0), (-20,0)]
snakes_list = []
myscreen.tracer(0) #smoothing out the animations

'''below is the first module which handles snake objects creation and their starting position'''
for positions in x_y_positions:
    snake = Turtle()
    snake.color("white")
    snake.shape("square")
    snake.penup()
    snake.shapesize(0.5, 0.5, 0.5)
    snake.goto(positions)
    snakes_list.append(snake)

'''below is the second module which handles snake movements'''
game_on = True
while game_on:
    myscreen.update() #smoothing out the animation
    time.sleep(0.3) #smooting out the animation

    for snakes in range(len(snakes_list) - 1, 0, -1):
        x_coordinates = snakes_list[snakes - 1].xcor()
        y_coordinates = snakes_list[snakes - 1].ycor()
        snakes_list[snakes].goto(x_coordinates, y_coordinates)
    snakes_list[0].forward(10)  # Moved this line inside the loop
    snakes_list[0].left(90)  # Moved this line inside the loop

print(myscreen)
myscreen.exitonclick()


