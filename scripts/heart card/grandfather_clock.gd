extends Area2D

var next_room = "res://scenes/clock_zoomed.tscn" 

#reference to the label
@onready var label: Label = $Label

func _ready():
	label.visible = false

func _on_body_entered(body):
	if body.name == "Alex" and GameState.pie_full and not GameState.pie_cooked and not GameState.has_hearts: 
		label.visible = true
		
func _on_body_exited(body):
	if body.name == "Alex":
		label.visible = false

#process function to listen for key press while player is near the door
func _process(_delta):
	if Input.is_action_just_pressed("interact") and label.visible:  
		get_tree().change_scene_to_file(next_room)
