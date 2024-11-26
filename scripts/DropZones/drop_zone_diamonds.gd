extends TextureRect

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] == "Diamond Card"

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] == "Diamond Card":
		if not GameState.diamond_card:
			GlobalHotbar.item_used("Diamond Card")
			GameState.diamond_card = true
			
			var diamond_card_node = get_node("../AceOfDiamonds")
			if diamond_card_node:
				diamond_card_node.visible = true
