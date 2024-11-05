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
			elif hotbar[slot_index].name == "Filled Cup":
				var item_data = {
				"name": item_name,
				"icon": item_icon
				}
				hotbar[slot_index] = item_data
				print("Added item to global hotbar:", item_data)
				return
			else:
				slot_index += 1
	elif item_name == "Clover":
		for slot_index in range(hotbar_size):
			if hotbar[slot_index].name == "Book":
				var item_data = {
				"name": item_name,
				"icon": item_icon
				}
				hotbar[slot_index] = item_data
				print("Added item to global hotbar:", item_data)
				return
			elif hotbar[slot_index].name == "Clover":
				var item_data = {
				"name": item_name,
				"icon": item_icon
				}
				hotbar[slot_index] = item_data
				print("Added item to global hotbar:", item_data)
				return
			elif hotbar[slot_index].name == "Club Card":
				var item_data = {
				"name": item_name,
				"icon": item_icon
				}
				hotbar[slot_index] = item_data
				print("Added item to global hotbar:", item_data)
				return
			
			else:
				slot_index += 1
	else:
		for slot_index in range(hotbar_size):
			if hotbar[slot_index] == null:
				var item_data = {
					"name": item_name,
					"icon": item_icon
				}
				hotbar[slot_index] = item_data
				print("Added item to global hotbar: ", item_data)
				return
			else:
				slot_index += 1

# remove item in hotbar
func item_used(item_name: String):
	for slot_index in range(hotbar_size):
		if hotbar[slot_index].name == item_name:
			hotbar[slot_index] = null
			print("Removed item from global hotbar: ", item_name)
			return
		else:
			slot_index += 1
	
# Get item data for a slot
func get_item_in_slot(slot_index: int):
	if slot_index >= 0 and slot_index < hotbar_size:
		return hotbar[slot_index]
	return null
