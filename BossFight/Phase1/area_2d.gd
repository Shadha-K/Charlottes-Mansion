extends Area2D

@export var knockback_force: float = 600  # The strength of the knockback

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		# Call damage-related methods
		get_tree().call_group("heartManager", "take_damage")  # Minus health from the heart bar
		get_tree().call_group("Player", "hit")  # Call the hit function in the Player script

		# Calculate knockback direction and apply it to the player
		var knockback_direction = (body.global_position - global_position).normalized()
		if body.has_method("apply_knockback"):
			body.apply_knockback(knockback_direction * knockback_force)
