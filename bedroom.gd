extends Node2D

@onready var hearts_container = get_node("CanvasLayer/HeartContainer")

func _ready() -> void:
	var player =get_node("Alex")
	var charlotte= get_node("Charlotte")
	
	if GameState.LRToBR_spawn_Alex!= "" and GameState.LRToBR_spawn_Char!="" and GameState.last_scene_exited=="LivingRoom" :
		var spawn_point=get_node(GameState.LRToBR_spawn_Alex)
		var spawn_point2=get_node(GameState.LRToBR_spawn_Char)
		if spawn_point and player and spawn_point2 and charlotte:
			player.position=spawn_point.global_position
			charlotte.position=spawn_point2.global_position
	if hearts_container == null:
		print("Error: HeartsContainer node not found in the scene.")
	else:
		GlobalHealthManager.initialize_hearts(hearts_container)
