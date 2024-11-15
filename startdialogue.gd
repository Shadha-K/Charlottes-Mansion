extends Node2D

func _ready():
	var player =get_node("TileMap/Alex")
	var charlotte= get_node("TileMap/Charlotte")
	if GameState.last_spawn_point_Alex != "" and GameState.last_spawn_point_charlotte !="":
		var spawn_point = get_node(GameState.last_spawn_point_Alex)
		var spawn_point2= get_node(GameState.last_spawn_point_charlotte)
		if spawn_point and player and spawn_point2 and charlotte:
			player.position = spawn_point.global_position
			charlotte.position=spawn_point2.global_position
		
		
	if GameState.first_time:
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/opening.dialogue"), "start")
		GameState.first_time = false
		return
