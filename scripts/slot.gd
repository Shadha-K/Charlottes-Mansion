extends Button

var item_name: String = ""

# Exported variable to set the TextureRect node in the editor
@export var texture_rect: TextureRect  # Reference to the TextureRect node

# Method to set the item in the slot
#func set_item(name: String, icon) -> void:
	#item_name = name
	#if texture_rect:  
		#texture_rect.texture = icon  
		#print("Setting item:", name)
	#self.text = item_name  
