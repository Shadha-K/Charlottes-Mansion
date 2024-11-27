extends Node2D 

var next_scene = "res://kitchen.tscn" 
@onready var label: Label = $Label

func _ready():
	label.visible = false

func _process(_delta):
	if GameState.pie_full:
		label.visible = true	
		
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file(next_scene)

	
