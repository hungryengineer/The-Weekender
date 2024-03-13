We will be creating a retro snake game. Below are the modules:

1. create a snake body: 
2. move the snake:
3. control the snake:
4. detect collision with the dot/food:
5. keep the score:
6. detect collision with the WALL and the TAIL:

+ + + + + + + + 
The list "snake_movements" contains snake objects and
we iterate over it using a variable called "snakes",
retrieving the x-coordinate of the segment that comes before the current segment(snakes). 
In the loop for snakes in range(len(snake_movements)-1, 0, -1):, 
snakes represents the index of each segment in reverse order, 
starting from the second-to-last segment (len(snake_movements)-1) 
and ending at the first segment (0). So, snake_movements[snakes - 1] 
gets the segment that comes before the current segment being processed 
in each iteration of the loop whose path will be traced by subsequent objects.

+ + + + + + + + 

How to handle collision detection with the tail?

Before handling collision detection with the tail, we should 
have a long enough tail. The tail grows as the snake eats food.
If the snake has to grow, it will grow from its tail which is
the last element in the list which is the whole snake itself denoted as snake_obj.
Now we need to get hold of the last element in the (unknown) list by using list[-1].position()
position is the turtle graphics function which will grab the coordinates of the element. 
These coordinates will be used to attach the extended segments(elements).
+ + + + + + + + + + + +

main.py is kept for reference to show how we have started implementing OOP
by refactoring the code in main.py