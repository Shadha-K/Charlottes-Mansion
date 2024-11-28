extends Area2D

var next_room = "res://scenes/oven_zoomed.tscn" 

#reference to the label
@onready var label: Label = $Label
@onready var label2: Label = $Label2

func _ready():
	label.visible = false
	label2.visible = false

func _on_body_entered(body):
	if not GameState.pie_cooked:
		if body.name == "Alex" and GameState.has_flour and GameState.has_sugar and GameState.has_milk and GameState.has_apples and not GameState.oven_exited: 
			label.visible = true
		elif body.name == "Alex" and GameState.oven_exited and GameState.clock_checked and not GameState.correct_time:
			label.visible = true
		elif body.name == "Alex" and GameState.correct_time and not GameState.oven_exited:
			label2.visible = true
		
func _on_body_exited(body):
	if body.name == "Alex":
		label.visible = false
		label2.visible = false

#process function to listen for key press while player is near the door
func _process(_delta):
	if Input.is_action_just_pressed("interact") and label.visible:  
		get_tree().change_scene_to_file(next_room)
