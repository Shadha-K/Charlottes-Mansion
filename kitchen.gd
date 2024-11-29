extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player =get_node("Alex")
	var charlotte= get_node("Charlotte")
	if GameState.LRtoK_spawn_Alex!= "" and GameState.LRtoK_spawn_charlotte!="":
		var spawn_point=get_node(GameState.LRtoK_spawn_Alex)
		var spawn_point2=get_node(GameState.LRtoK_spawn_charlotte)
		if spawn_point and player and spawn_point2 and charlotte:
			player.position=spawn_point.global_position
			player.direction = Vector2(1,0)
			player.update_animation_parameters()
			charlotte.position=spawn_point2.global_position
	if GameState.last_scene_exited == "sink":		
		if GameState.sink_spawn_point_Alex != "" and GameState.sink_spawn_point_charlotte !="":
			var spawn_point = get_node(GameState.sink_spawn_point_Alex)
			var spawn_point2= get_node(GameState.sink_spawn_point_charlotte)
			if spawn_point and player and spawn_point2 and charlotte:
				player.position = spawn_point.global_position
				charlotte.position=spawn_point2.global_position
