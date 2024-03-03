import turtle
from turtle import Turtle

X_Y_positions = [(0,0), (-10,0), (-20,0)]
UP = 90
DOWN = 270
LEFT = 180
RIGHT = 0
class Snake:
    def __init__(self):
        self.snakes_list = []
        self.snake_creation()
        self.head = self.snakes_list[0]
        self.snake_movement()
        self.up()

    def snake_creation(self):
        for position in X_Y_positions:
            self.add_extra_snakes(position)

    def add_extra_snakes(self, position):
            snake = Turtle()
            snake.color("white")
            snake.shape("square")
            snake.penup()
            snake.shapesize(0.5, 0.5, 0.5)
            snake.goto(position)
            self.snakes_list.append(snake)

    def extend(self):
        self.add_extra_snakes(self.snakes_list[-1].position())
    def snake_movement(self):
        for snakes in range(len(self.snakes_list) - 1, 0, -1):
            x_coordinates = self.snakes_list[snakes - 1].xcor()
            y_coordinates = self.snakes_list[snakes - 1].ycor()
            self.snakes_list[snakes].goto(x_coordinates, y_coordinates)
        self.head.forward(10)  # Moved this line inside the loop
    def up(self):
        if self.head.heading() != DOWN:
            self.head.setheading(UP)
    def down(self):
        if self.head.heading() != UP:
            self.head.setheading(DOWN)
    def left(self):
        if self.head.heading() != RIGHT:
            self.head.setheading(LEFT)
    def right(self):
        if self.head.heading() != LEFT:
            self.head.setheading(RIGHT)