extends Node2D 

var next_room_scene = "res://kitchen.tscn" 
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $AnimatedSprite2D/Label

func _ready():
	label.visible = false 
	set_process_unhandled_input(true)

func _process(_delta):
	if GameState.has_water:
		label.visible = true
		
	if Input.is_action_just_pressed("interact"):
		GameState.d_teacup = false
		GameState.d_full_cup = true
		get_tree().change_scene_to_file(next_room_scene)
