extends Area2D

var player_in_range = false

# Called when the node enters the scene tree for the first time.
func _on_Area2D_body_entered(body):
	if body.name == "Alex":  
		player_in_range = true  

# This function is called when another body exits the Area2D
func _on_Area2D_body_exited(body):
	if body.name == "Alex":
		player_in_range = false  

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_range and Input.is_action_just_pressed("interact"): 
		$AnimationPlayer.play("tea_tray")
