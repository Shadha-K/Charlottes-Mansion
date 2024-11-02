extends Node

var hotbar = []
var hotbar_size = 6

func _ready():
	for i in range(hotbar_size):
		hotbar.append(null)

# Add item to a specific slot
func add_item_to_slot(slot_index: int, item_name: String, item_icon: Texture):
	if slot_index < 0 or slot_index >= hotbar_size:
		print("Invalid slot index")
		return
	
	var item_data = {
		"name": item_name,
		"icon": item_icon
	}
	hotbar[slot_index] = item_data
	print("Added item to global hotbar:", item_data)

# Get item data for a slot
func get_item_in_slot(slot_index: int):
	if slot_index >= 0 and slot_index < hotbar_size:
		return hotbar[slot_index]
	return null
