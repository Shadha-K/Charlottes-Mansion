extends TextureRect

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] == "Spade Card"

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] == "Spade Card":
		if not GameState.spade_card:
			GlobalHotbar.item_used("Spade Card")
			GameState.spade_card = true
			
			var spade_card_node = get_node("../AceOfSpades")
			if spade_card_node:
				spade_card_node.visible = true
