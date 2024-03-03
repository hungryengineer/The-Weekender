import random
import turtle
from turtle import Turtle
from snake import Snake
from food import Food

class ScoreBoard(Turtle):
    def __init__(self):
        super().__init__()
        self.score = 0
        self.color("white")
        self.hideturtle()
        self.penup()
        self.goto(-270, 270)
        self.write(f"Score:{self.score}", move=False, align='left', font=('Courier', 15, 'normal'))

    def game_over(self):
        self.goto(0,0)
        self.write(f"GAMEOVER\nscore is {self.score}", move=False, align='center', font=('Courier', 15, 'normal'))


    def score_increament(self):
        self.clear()
        self.score += 1
        self.write(f"Score:{self.score}", move=False, align='left', font=('Arial', 15, 'normal'))

