extends Area2D

var next_room_scene = "res://node_2d.tscn" 

#process function to listen for key press while player is near the door
func _process(_delta):
	if Input.is_action_just_pressed("interact"):  
		get_tree().change_scene_to_file(next_room_scene)
