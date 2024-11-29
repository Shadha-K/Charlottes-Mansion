extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().call_group("heartManager", "take_damage") # minus health from heart bar
		get_tree().call_group("Player", "hit") # calls hit function in alex.gd
		#^^calls function in specified group in the tree
	if not body.is_in_group("Enemy"):
		get_parent().queue_free()
