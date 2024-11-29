extends TextureRect

@export var accepted_items: Array[String] = ["Milk", "Flour", "Sugar", "Apples"]

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] in accepted_items

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if _can_drop_data(_at_position, data):
		if GlobalHotbar != null:
			GlobalHotbar.item_used(data["name"])
			accepted_items.erase(data["name"])
			if accepted_items.is_empty():
				GameState.pie_full = true
				GameState.d_pie = true
				GameState.d_recipes_book = false
		else:
			print("GlobalHotbar is not initialized")
