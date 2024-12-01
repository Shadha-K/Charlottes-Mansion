extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		# Call damage-related methods
		get_tree().call_group("heartManager", "take_damage")  # Minus health from the heart bar
		get_tree().call_group("Player", "hit")  # Call the hit function in the Player script
	if not body.is_in_group("Enemy"):
		get_parent().queue_free()
