import random
import turtle
from turtle import Turtle
from snake import Snake

class Food(Turtle):
    def __init__(self):
        super().__init__()
        self.shape("turtle")
        self.penup()
        self.shapesize(stretch_wid=0.5, stretch_len=0.5)
        self.color("green")
        self.speed("fastest")
        self.refresh_food_location()
    def refresh_food_location(self):
        self.x_coordinates = random.randint(-280, 280)
        self.y_coordinates = random.randint(-280, 280)
        self.goto(self.x_coordinates, self.y_coordinates)


