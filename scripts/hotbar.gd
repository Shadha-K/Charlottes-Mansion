#extends HBoxContainer
#
#@onready var slots = get_children()  
#var item_icon = preload("res://assets/puzzle_objects/puzzle_cup.png") 
#
#var current_index: int:
	#set(value):
		#current_index = value
		#reset_focus()
		#set_focus()
#
#func _ready():
	#current_index = 0 
#
#func reset_focus():
	#for slot in slots:
		#slot.set_process_input(false)
#
#func set_focus():
	#get_child(current_index).grab_focus()
	#get_child(current_index).set_process_input(true)
#
#func _input(event):
	#if event.is_action_pressed("scroll_down"):
		#if current_index == get_child_count() - 1:
			#current_index = 0  
		#else:
			#current_index += 1  
#
	#if event.is_action_pressed("scroll_up"):
		#if current_index == 0:
			#current_index = get_child_count() - 1  
		#else:
			#current_index -= 1  
#
## Function to add an item to a specific slot
#func add_item_to_slot(index: int, item_name: String, item_icon: Texture) -> void:
	#if index < 0 or index >= get_child_count():
		#print("Invalid slot index")
		#return
#
	#var slot = get_child(index)  
	#if slot is Button:  
		#if slot.has_method("set_item"):  
			#slot.set_item(item_name, item_icon) 
			#print("Added item to slot:", item_name)
		#else:
			#print("Slot does not have the set_item method")
			
extends HBoxContainer

var hotbar = []
var hotbar_size = 6

func _ready():
	for i in range(hotbar_size):
		hotbar.append(null)

# updates hotbar ui

# adds item to hotbar
func add_item_to_slot(slot_index: int, item_name: String, item_icon: Texture):
	var item_data = {
		"name": item_name,
		"icon": item_icon
	}
	hotbar[slot_index] = item_data
	
	var button = get_child(slot_index)
	var label = button.get_child(0)
	label.text = item_name
	var texture_rect = button.get_child(1)
	texture_rect.texture = item_icon
