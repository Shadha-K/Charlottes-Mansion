extends Node2D 

var next_scene = "res://node_2d.tscn" 
@onready var label: Label = $Label

func _ready():
	label.visible = true

func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		GameState.clock_checked = true
		get_tree().change_scene_to_file(next_scene)
