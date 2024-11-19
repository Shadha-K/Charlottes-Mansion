extends Node2D

@onready var hearts_container = get_node("CanvasLayer/HeartContainer")

func _ready() -> void:
	var player =get_node("TileMap/Alex")
	var charlotte= get_node("TileMap/Charlotte")
	var spawn_point=""
	var spawn_point2=""
	if GameState.LRToBR_spawn_Alex!= "" and GameState.LRToBR_spawn_Char!="" and GameState.last_scene_exited=="LivingRoom" :
		spawn_point=get_node(GameState.LRToBR_spawn_Alex)
		spawn_point2=get_node(GameState.LRToBR_spawn_Char)
		if spawn_point and player and spawn_point2 and charlotte:
			player.position=spawn_point.global_position
			charlotte.position=spawn_point2.global_position
	elif GameState.VanityToBR_spawn_Alex!= "" and GameState.VanityToBR_spawn_Char!="" and GameState.last_scene_exited=="Vanity" :
		spawn_point=get_node(GameState.VanityToBR_spawn_Alex)
		spawn_point2=get_node(GameState.VanityToBR_spawn_Char)
		if spawn_point and player and spawn_point2 and charlotte:
			player.position=spawn_point.global_position
			charlotte.position=spawn_point2.global_position	
	if hearts_container == null:
		print("Error: HeartsContainer node not found in the scene.")
	else:
		GlobalHealthManager.initialize_hearts(hearts_container)
