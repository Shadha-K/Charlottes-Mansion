extends TextureRect

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] == "Spades Card"

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] == "Spades Card":
		if not GameState.spades_card:
			GlobalHotbar.item_used("Spades Card")
			GameState.spades_card = true
			
			var spade_card_node = get_node("../AceofSpades")
			if spade_card_node:
				spade_card_node.visible = true
