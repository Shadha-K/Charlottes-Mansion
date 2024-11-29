extends Node2D  # Or the appropriate base class for your living room scene

@onready var temp_book_scene = preload("res://recipe_book2.tscn")  # Path to the book scene

func _ready():
	var temp_book_instance = temp_book_scene.instantiate()  # Instantiate the book scene
	add_child(temp_book_instance)  # Add the book to the living room
	temp_book_instance.position = Vector2(264, -23)  # Set the position (adjust as needed)
	print("Temp book instance added at position: ", temp_book_instance.position)  # Debugging line
