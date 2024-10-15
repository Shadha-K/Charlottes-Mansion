extends Area2D

# Signal emitted when the book is picked up
signal book_picked_up()

@onready var player = null  
@onready var hotbar = get_node("/root/Hotbar")  

# Function called when the scene is ready
func _ready():
	$Label.visible = false
	var grandparent = get_parent().get_parent()
	player = grandparent.get_node("Alex")
	add_to_group("Books")  # Add to the "Books" group

# Function called when something enters the area (the player)
func _on_body_entered(body: Node2D) -> void:
		if body.name == "Alex": 
			$Label.visible = true  

# Function called when something exits the area (the player)
func _on_body_exited(body: Node2D) -> void:
		if body.name == "Alex": 
			$Label.visible = false  # Make the label invisible when the player leaves

# Function to process player input (e.g., picking up the book)
func _process(_delta):
	if Input.is_action_just_pressed("interact"):  
		if $Label.visible:  
			pick_up_book()

# Function to handle the book being picked up
func pick_up_book():
	emit_signal("book_picked_up")  
	hotbar.add_item_to_slot(1, "Book", preload("res://assets/puzzle_objects/tempbook.png"))
	queue_free()  
