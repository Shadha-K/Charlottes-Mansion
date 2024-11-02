extends Node

var hotbar = []
var hotbar_size = 6

func _ready():
	for i in range(hotbar_size):
		hotbar.append(null)

# Add item to a specific slot
func add_item_to_slot(item_name: String, item_icon: Texture):
	# Special case to replace empty cup with filled cup
	if item_name == "Filled Cup":
		for slot_index in range(hotbar_size):
			if hotbar[slot_index].name == "Teacup":
				var item_data = {
				"name": item_name,
				"icon": item_icon
				}
				hotbar[slot_index] = item_data
				print("Added item to global hotbar:", item_data)
				return
			else:
				for slot_index2 in range(hotbar_size):
					if hotbar[slot_index2].name == "Filled Cup":
						var item_data = {
						"name": item_name,
						"icon": item_icon
						}
						hotbar[slot_index] = item_data
						print("Added item to global hotbar:", item_data)
						return
	else:
		for slot_index in range(hotbar_size):
			if hotbar[slot_index] == null:
				var item_data = {
					"name": item_name,
					"icon": item_icon
				}
				hotbar[slot_index] = item_data
				print("Added item to global hotbar:", item_data)
				return
			else:
				slot_index += 1

# Get item data for a slot
func get_item_in_slot(slot_index: int):
	if slot_index >= 0 and slot_index < hotbar_size:
		return hotbar[slot_index]
	return null
