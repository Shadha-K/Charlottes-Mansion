extends Node

var player_health = 9
var current_health = 9 

func decrease_health(amount):
	player_health -= amount
	player_health = max(player_health, 0)
