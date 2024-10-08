extends Area2D

var next_room_scene = "res://kitchen.tscn" 
var player_near_door = false 

#reference to the label
@onready var press_e_label = $Label 

func _ready():
	press_e_label.visible = false

#function to detect when player enters the door area
func _on_body_entered(body):
	if body.name == "CharacterBody2D": 
		player_near_door = true
		press_e_label.visible = true
		
#function to detect when player leaves door area
func _on_body_exited(body):
	if body.name == "CharacterBody2D":
		player_near_door = false
		press_e_label.visible = false

#process function to listen for key press while player is near the door
func _process(_delta):
	if player_near_door and Input.is_action_just_pressed("interact"):  
		get_tree().change_scene_to_file(next_room_scene)
			
