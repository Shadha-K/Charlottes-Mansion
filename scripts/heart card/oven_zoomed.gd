extends Node2D 

var next_scene = "res://kitchen.tscn" 
@onready var label: Label = $Label

func _ready():
	label.visible = false

func _process(_delta):
	if GameState.pie_full and not GameState.oven_exited:
		label.visible = true	
		
		if Input.is_action_just_pressed("interact"):
			GameState.oven_exited = true
			get_tree().change_scene_to_file(next_scene)
			
	elif GameState.pie_full and GameState.oven_exited:
		label.visible = false
		
		
		

	
