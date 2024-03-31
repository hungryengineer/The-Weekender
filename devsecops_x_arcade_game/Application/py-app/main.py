import colorgram
from turtle import Turtle
import random
import turtle

colors = colorgram.extract('hirst_painting.jpg', 9)
print(colors)
color_palette = []
for color in colors:
    rgb = color.rgb # e.g. (255, 151, 210)
    color_palette.append((rgb.r, rgb.b, rgb.g))
print(color_palette)


timmy = Turtle() #timmy is an object instantiated from the Turtle class
timmy.shape("turtle")
timmy.speed('fast')
myscreen = turtle.Screen()
myscreen.colormode(255)
myscreen.bgcolor("aqua")

#generating a random walk
direction = [0, 90, 180, 270]
for i in range(50):
    timmy.pensize(5)
    timmy.color(random.choice(color_palette))
    timmy.fillcolor(random.choice(color_palette))
    timmy.setheading(random.choice(direction))
    timmy.forward(30)
print(timmy)
print(myscreen)
myscreen.exitonclick()