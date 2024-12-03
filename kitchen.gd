extends Node2D

var paused = false
@onready var pause_menu: Control = $CanvasLayer/PauseMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player =get_node("Alex")
	var charlotte= get_node("Charlotte")
	if pause_menu:
		pause_menu.hide()  # Ensure the pause menu is hidden on scene start
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
				player.direction = Vector2(0,-1)
				player.update_animation_parameters()
				charlotte.position=spawn_point2.global_position
	if GameState.last_scene_exited == "icebox":		
		if GameState.IcetoK_spawn_Alex != "" and GameState.IcetoK_spawn_Char !="":
			var spawn_point = get_node(GameState.IcetoK_spawn_Alex)
			var spawn_point2= get_node(GameState.IcetoK_spawn_Char)
			if spawn_point and player and spawn_point2 and charlotte:
				player.position = spawn_point.global_position
				player.direction = Vector2(0,-1)
				player.update_animation_parameters()
				charlotte.position=spawn_point2.global_position
	if GameState.last_scene_exited == "Cab1":		
		if GameState.Cab1toK_spawn_Alex != "" and GameState.Cab1toK_spawn_Char !="":
			var spawn_point = get_node(GameState.Cab1toK_spawn_Alex)
			var spawn_point2= get_node(GameState.Cab1toK_spawn_Char)
			if spawn_point and player and spawn_point2 and charlotte:
				player.position = spawn_point.global_position
				player.direction = Vector2(0,-1)
				player.update_animation_parameters()
				charlotte.position=spawn_point2.global_position
	if GameState.last_scene_exited == "Cab2":		
		if GameState.Cab2toK_spawn_Alex != "" and GameState.Cab2toK_spawn_Char !="":
			var spawn_point = get_node(GameState.Cab2toK_spawn_Alex)
			var spawn_point2= get_node(GameState.Cab2toK_spawn_Char)
			if spawn_point and player and spawn_point2 and charlotte:
				player.position = spawn_point.global_position
				player.direction = Vector2(0,-1)
				player.update_animation_parameters()
				charlotte.position=spawn_point2.global_position
	if GameState.last_scene_exited == "Oven":		
		if GameState.OventoK_spawn_Alex != "" and GameState.OventoK_spawn_Char !="":
			var spawn_point = get_node(GameState.OventoK_spawn_Alex)
			var spawn_point2= get_node(GameState.OventoK_spawn_Char)
			if spawn_point and player and spawn_point2 and charlotte:
				player.position = spawn_point.global_position
				player.direction = Vector2(0,-1)
				player.update_animation_parameters()
				charlotte.position=spawn_point2.global_position
	


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if not pause_menu:
		print("Pause menu node is missing!")
		return

	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0

	paused = !paused
