extends Node2D

@onready var hearts_container = get_node("CanvasLayer/HeartContainer")
@onready var pause_menu: Control = $CanvasLayer/PauseMenu
var paused = false

func _ready() -> void:
	var player =get_node("TileMap/Alex")
	var charlotte= get_node("TileMap/Charlotte")
	var spawn_point=""
	var spawn_point2=""
	if pause_menu:
		pause_menu.hide()  # Ensure the pause menu is hidden on scene start
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
			player.direction = Vector2(0,-1)
			player.update_animation_parameters()
			charlotte.position=spawn_point2.global_position	
	elif GameState.JBoxToBR_spawn_Alex!="" and GameState.JBoxToBR_spawn_Char!="" and GameState.last_scene_exited=="JBox":
		spawn_point=get_node(GameState.JBoxToBR_spawn_Alex)
		spawn_point2=get_node(GameState.JBoxToBR_spawn_Char)
		if spawn_point and player and spawn_point2 and charlotte:
			player.position=spawn_point.global_position
			charlotte.position=spawn_point2.global_position
	if hearts_container == null:
		print("Error: HeartsContainer node not found in the scene.")
	else:
		GlobalHealthManager.initialize_hearts(hearts_container)
		

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
