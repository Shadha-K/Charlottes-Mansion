extends Area2D

# Signal emitted when the book is picked up
signal book_picked_up()

@onready var player = null  
@onready var hotbar = get_node("/root/living_room/UI/Hotbar")  
@onready var gamestate = get_node("/root/GameState")

# Function called when the scene is ready
func _ready():
	$Label.visible = false
	var grandparent = get_parent().get_parent()
	player = grandparent.get_node("Alex")
	add_to_group("Books")  # Add to the "Books" group
	if gamestate.books_picked_up.has(name) and gamestate.books_picked_up[name] == true:
		queue_free()

# Function called when something enters the area (the player)
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Alex" and get_tree().root.get_node("GameState").has_book: 
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
	GlobalHotbar.add_item_to_slot("Book", preload("res://assets/puzzle_objects/tempbook.png"))
	gamestate.books_picked_up[name] = true	
	queue_free()  
