extends TextureRect

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] == "Heart Card"

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] == "Heart Card":
		if not GameState.heart_card:
			GlobalHotbar.item_used("Heart Card")
			GameState.heart_card = true
			
			var heart_card_node = get_node("../AceofHearts")
			if heart_card_node:
				heart_card_node.visible = true
