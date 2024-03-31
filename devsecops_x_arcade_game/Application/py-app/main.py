import random #imported random functions for choosing random cards
from art import logo_blackjack
print(logo_blackjack)
# list_cards = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10] #defined a cards list as well as their values
# player_blackjack = {} #dictionary to store player cards
# computer_blackjack = {} #dictionary to store computer cards

# def blackjack(): #defining a function for resuability
#     while sum(player_blackjack) <= 21 or sum(computer_blackjack) < 21: #using a while loop to repeat until either card values is less than 21
#         player_choice = input("Type y to pick a card\n") #player picks a card
#         if player_choice == 'y':
#             player_card = random.choice(list_cards) #a random card is chosen from the list
#             #print(player_card) #code check by printing output
#             player_blackjack[player_card] = player_blackjack #saving the player card chosen to dictionary
#         print(player_blackjack) #code check by printing output
        
#         computer_card = random.choice(list_cards) #computer picks a card
#         computer_blackjack[computer_card] = computer_blackjack #saving the computer card chosen to dictionary
#         print(computer_blackjack) #code check by printing output

#     if sum(player_blackjack) >= sum(computer_blackjack): # conditional to check whose sum is closer to 21
#       print("Player wins!")
#     else:
#       sum(player_blackjack) <= sum(computer_blackjack)
#       print("Computer wins!")

#     retry = input("Type 1 to continue\n") 
#     if retry == "1":
#       blackjack() #recursion to loop back to the function again
#     else:
#       print("Game over!")

# blackjack()

