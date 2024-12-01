extends Node

var player: CharacterBody2D
var teacup = preload("res://teacup.tscn")
var teapot = preload("res://teapot.tscn")
var area: Area2D  # Reference to the Area2D where enemies must spawn

func _process(delta):
	if GameState.spawn_2_enem:
		spawn_enemy_2()
		GameState.spawn_2_enem = false
	if GameState.spawn_4_enem:
		spawn_enemy_4()
		GameState.spawn_4_enem = false
	if GameState.spawn_bedroom:
		spawn_bedroom()
		GameState.spawn_bedroom = false
	if GameState.spawn_icebox:
		spawn_icebox()
		GameState.spawn_icebox = false

func spawn_enemy_2():
	player = get_tree().get_first_node_in_group("Player")
	if not player:
		print("Player not found!")
		return
	
	var player_position = player.position
	var spawn_offsets = [
		Vector2(100, 0),  
		Vector2(-100, 0), 
	]

	for offset in spawn_offsets:
		var spawn_position = player_position + offset
		var enemy = teacup.instantiate()
		enemy.position = spawn_position
		add_child(enemy)

func spawn_enemy_4():
	player = get_tree().get_first_node_in_group("Player")
	if not player:
		print("Player not found!")
		return
	
	var player_position = player.position
	var teacup_spawn_offsets = [
		Vector2(100, 0),  
		Vector2(-100, 0), 
	]
	var teapot_spawn_offsets = [
		Vector2(50, 150),
	]

	for offset in teacup_spawn_offsets:
		var spawn_position = player_position + offset
		var enemy = teacup.instantiate()
		enemy.position = spawn_position
		add_child(enemy)
		
	for offset in teapot_spawn_offsets:
		var spawn_position = player_position + offset
		var enemy = teapot.instantiate()
		enemy.position = spawn_position
		add_child(enemy)

func spawn_bedroom():
	player = get_tree().get_first_node_in_group("Player")
	if not player:
		print("Player not found!")
		return
	
	var player_position = player.position
	var teacup_spawn_offsets = [
		Vector2(150, 0),  
		Vector2(100, 0), 
	]
	var teapot_spawn_offsets = [
		Vector2(100, 150),
	]

	for offset in teacup_spawn_offsets:
		var spawn_position = player_position + offset
		var enemy = teacup.instantiate()
		enemy.position = spawn_position
		add_child(enemy)
		
	for offset in teapot_spawn_offsets:
		var spawn_position = player_position + offset
		var enemy = teapot.instantiate()
		enemy.position = spawn_position
		add_child(enemy)
		
func spawn_icebox():
	player = get_tree().get_first_node_in_group("Player")
	if not player:
		print("Player not found!")
		return
	
	var player_position = player.position
	var spawn_offsets = [
		Vector2(0, 150), 
		Vector2(0, 100),  
	]

	for offset in spawn_offsets:
		var spawn_position = player_position + offset
		var enemy = teacup.instantiate()
		enemy.position = spawn_position
		add_child(enemy)
