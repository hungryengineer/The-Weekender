import random
import turtle
from turtle import Turtle
from snake import Snake
from food import Food

class ScoreBoard(Turtle):
    def __init__(self):
        super().__init__()
        self.score = 0
        with open("data.txt") as data:
          self.highscore = int(data.read())
        self.color("white")
        self.hideturtle()
        self.penup()
        self.goto(-270, 270)
        self.write(f"Score:{self.score}", move=False, align='left', font=('Courier', 15, 'normal'))

    def update_scoreboard(self):
        self.score += 1
        self.write(f"Score:{self.score}, Highscore:{self.highscore}", move=False, align='left', font=('Arial', 15, 'normal'))


    def reset_scoreboard(self):
        if self.score > self.highscore:
            self.highscore = self.score
            with open("data.txt", mode='w') as data:
                data.write(f"{self.highscore}")
        self.score = 0
        self.update_scoreboard()

    def score_increament(self):
        self.clear()
        self.update_scoreboard()

