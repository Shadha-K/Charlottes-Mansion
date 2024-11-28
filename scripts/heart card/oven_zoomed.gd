extends Node2D 

var next_scene = "res://kitchen.tscn" 
@onready var label: Label = $Label
@onready var pie: Sprite2D = $Pie
@onready var up_button: Button = $Control/up_button
@onready var down_button: Button = $Control/down_button

func _ready():
	label.visible = false
	up_button.visible = false
	down_button.visible = false
	pie.visible = false

func _process(_delta):
	if GameState.pie_full and not GameState.oven_exited and not GameState.correct_time:
		label.visible = true	
		
		if Input.is_action_just_pressed("interact"):
			GameState.oven_exited = true
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
				get_tree().change_scene_to_file(next_scene)
				
	elif GameState.pie_full and GameState.correct_time and not GameState.oven_exited:
		label.visible = false
		pie.visible = true
		GameState.pie_cooked
		
		
		

	
