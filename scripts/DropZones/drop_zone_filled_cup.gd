extends TextureRect

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] == "Filled Cup"

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] == "Filled Cup":
		var animation_node = get_node("../AnimatedSprite2D/Label2")
		if animation_node:
			animation_node.visible = true
		
		GameState.vanity_interacted = true
		GlobalHotbar.item_used("Filled Cup")
		
		get_node("../AnimatedSprite2D").play("numbers")
