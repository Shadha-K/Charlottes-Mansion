extends Node2D 

var next_scene = "res://node_2d.tscn"
@onready var label: Label = $Label7
var spawn_point_name = "RecBookAlexSpawn"
var spawn_point_name2 = "RecBookCharSpawn"
func _ready():
	label.visible = true

func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		GameState.last_scene_exited = "RecipeBook" 
		GameState.RecBookToLR_spawn_Alex = spawn_point_name
		GameState.RecBookToLR_spawn_Char = spawn_point_name2
		get_tree().change_scene_to_file(next_scene)
