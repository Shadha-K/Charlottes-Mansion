extends Node2D 

var next_scene = "res://kitchen.tscn" 
@onready var label: Label = $Label
@onready var label2: Label = $Label2
@onready var pie: Sprite2D = $Pie
@onready var up_button: Button = $Control/up_button
@onready var down_button: Button = $Control/down_button
var spawn_point_name = "OventoKAlexSpawn"
var spawn_point_name2= "OventoKCharSpawn"

func _ready():
	label.visible = false
	label2.visible = false
	up_button.visible = false
	down_button.visible = false
	pie.visible = false

func _process(_delta):
	if GameState.pie_full and not GameState.oven_exited and not GameState.correct_time:
		label.visible = true	
		
		if Input.is_action_just_pressed("interact"):
			GameState.oven_exited = true
			GameState.last_scene_exited="Oven"
			GameState.OventoK_spawn_Alex= spawn_point_name
			GameState.OventoK_spawn_Char=spawn_point_name2
			get_tree().change_scene_to_file(next_scene)
			
	elif GameState.pie_full and GameState.oven_exited:
		label.visible = false
		up_button.visible = true
		down_button.visible = true
		
		if GameState.correct_time:
			label.visible = true
			
			if Input.is_action_just_pressed("interact"):
				up_button.visible = false
				down_button.visible = false
				GameState.oven_exited = false
				GameState.last_scene_exited="Oven"
				GameState.OventoK_spawn_Alex= spawn_point_name
				GameState.OventoK_spawn_Char=spawn_point_name2
				get_tree().change_scene_to_file(next_scene)
				
	elif GameState.pie_full and GameState.correct_time and not GameState.oven_exited:
		label.visible = false
		pie.visible = true
		GameState.pie_cooked
		
		if Input.is_action_just_pressed("click or drag") and not GameState.has_hearts:
			label2.visible = true
			GameState.has_hearts = true
			GlobalHotbar.item_used("Recipe Book")
			GlobalHotbar.add_item_to_slot("Heart Card", preload("res://assets/puzzle_objects/AceOfHearts.png"))
			
		if Input.is_action_just_pressed("interact") and GameState.has_hearts:
			
			get_tree().change_scene_to_file(next_scene)
		
		
		

	
