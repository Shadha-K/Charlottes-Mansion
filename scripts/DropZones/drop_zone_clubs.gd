extends TextureRect

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] == "Club Card"

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] == "Club Card":
		if not GameState.club_card:
			GlobalHotbar.item_used("Club Card")
			GameState.club_card = true
			
			var club_card_node = get_node("../AceOfClubs")
			if club_card_node:
				club_card_node.visible = true
