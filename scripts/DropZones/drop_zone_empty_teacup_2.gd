extends TextureRect

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] == "Teacup"

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] == "Teacup":
		GlobalHotbar.add_item_to_slot("Filled Cup", preload("res://assets/puzzle_objects/puzzle_cup_full.png"))
