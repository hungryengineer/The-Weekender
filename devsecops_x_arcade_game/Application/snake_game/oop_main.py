import time
from turtle import Screen, Turtle
from snake import Snake
from food import Food
from scoreboard import ScoreBoard

myscreen = Screen()
myscreen.setup(width=600, height=600)
myscreen.bgcolor("black")
myscreen.title("retro_snake_game")
snake = Turtle()
myscreen.tracer(0) #smoothing out the animations

'''below is the first module which handles snake objects creation and their starting position'''
snake_obj = Snake()
'''below object creates the food for the snake'''
food = Food()
'''scoreboard'''
score = ScoreBoard()

'''to control the movement of the snake'''
myscreen.listen()
myscreen.onkey(snake_obj.up, "Up")
myscreen.onkey(snake_obj.down, "Down")
myscreen.onkey(snake_obj.left, "Left")
myscreen.onkey(snake_obj.right, "Right")

'''below is the second module which handles snake movements'''
game_on = True
while game_on:
    myscreen.update() #smoothing out the animation
    time.sleep(0.175) #smooting out the animation
    snake_obj.snake_movement()
    if snake_obj.head.distance(food) < 10: #food collision detection
        food.refresh_food_location()
        snake_obj.extend()
        score.score_increament()

    if snake_obj.head.xcor() > 280 or snake_obj.head.xcor() < -280 or snake_obj.head.ycor() > 280 or snake_obj.head.ycor() < -280:
        game_on = False
        score.game_over()

    for obj in snake_obj.snakes_list[1:]:
        if snake_obj.head.distance(obj) < 10:
            game_on = False
            score.game_over()

print(myscreen)
myscreen.exitonclick()


