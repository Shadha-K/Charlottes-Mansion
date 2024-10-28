extends Node

var player_health = 9
var current_health = 9
var books_picked_up: Dictionary = {}
 

func decrease_health(amount):
	player_health -= amount
	player_health = max(player_health, 0)

func reset_books():
	books_picked_up.clear()
