extends Area2D

var next_room = "res://scenes/open_icebox.tscn" 
var spawn_point_name = "IcetoKAlexSpawn"
var spawn_point_name2= "IcetoKCharSpawn"
#reference to the label
@onready var label: Label = $Label

func _ready():
	label.visible = false

func _on_body_entered(body):
	if body.name == "Alex" and GameState.has_recipe_book and not GameState.has_milk: 
		label.visible = true
	
	if body.name == "Alex" and GameState.has_bottle and not GameState.has_note:
		label.visible = true
		
func _on_body_exited(body):
	if body.name == "Alex":
		label.visible = false

#process function to listen for key press while player is near the door
func _process(_delta):
	if Input.is_action_just_pressed("interact") and label.visible:  
		GameState.last_scene_exited="icebox"
		GameState.IcetoK_spawn_Alex= spawn_point_name
		GameState.IcetoK_spawn_Char=spawn_point_name2
		get_tree().change_scene_to_file(next_room)
