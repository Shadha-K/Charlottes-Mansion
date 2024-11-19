extends Node2D

func _ready():
	var player =get_node("TileMap/Alex")
	var charlotte= get_node("TileMap/Charlotte")
	var spawn_point=""
	var spawn_point2=""
	if GameState.last_spawn_point_Alex != "" and GameState.last_spawn_point_charlotte !="" and GameState.last_scene_exited=="Bedroom":
		spawn_point = get_node(GameState.last_spawn_point_Alex)
		spawn_point2= get_node(GameState.last_spawn_point_charlotte)
		if spawn_point and player and spawn_point2 and charlotte:
			player.position = spawn_point.global_position
			charlotte.position=spawn_point2.global_position
	elif GameState.KtoLR_spawn_point_Alex!="" and GameState.KtoLR_spawn_point_charlotte !="" and GameState.last_scene_exited=="Kitchen":
		spawn_point = get_node(GameState.KtoLR_spawn_point_Alex)
		spawn_point2=get_node(GameState.KtoLR_spawn_point_charlotte)
		if spawn_point and player and spawn_point2 and charlotte:
			player.position =spawn_point.global_position
			charlotte.position=spawn_point2.global_position
	elif GameState.FireToLR_spawn_Alex !="" and GameState.FireToLR_spawn_Char !="" and GameState.last_scene_exited=="Fire":
		spawn_point= get_node(GameState.FireToLR_spawn_Alex)
		spawn_point2=get_node(GameState.FireToLR_spawn_Char)
		if spawn_point and player and spawn_point2 and charlotte:
			player.position = spawn_point.global_position
			charlotte.position=spawn_point2.global_position
	elif GameState.BasementToLR_spawn_Alex!=""and GameState.BasementToLR_spawn_Char!="" and GameState.last_scene_exited=="Basement":
		spawn_point=get_node(GameState.BasementToLR_spawn_Alex)
		spawn_point2=get_node(GameState.BasementToLR_spawn_Char)
		if spawn_point and player and spawn_point2 and charlotte:
			player.position =spawn_point.global_position
			charlotte.position=spawn_point2.global_position
		
			
	if GameState.opening:
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/opening.dialogue"), "start")
		GameState.opening = false
		return
