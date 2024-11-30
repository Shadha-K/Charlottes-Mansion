extends Area2D

@onready var player = null  
 
@onready var gamestate = get_node("/root/GameState")

# Function called when the scene is ready
func _ready():
	$Label.visible = false
	var grandparent = get_parent().get_parent()
	player = grandparent.get_node("Alex")
	
	
	if GameState.has_book and gamestate.book_used_in_fireplace:
		$Label.visible=false

# Function called when something enters the area (the player)
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Alex" and GameState.has_book and not gamestate.book_used_in_fireplace: 
		$Label.visible = true 

# Function called when something exits the area (the player)
func _on_body_exited(body: Node2D) -> void:
		if body.name == "Alex": 
			$Label.visible = false  # Make the label invisible when the player leaves

# Function to process player input (e.g., picking up the book)
func _process(_delta):
	if Input.is_action_just_pressed("interact"):  
		if $Label.visible:  
			throw_book()

# Function to handle the book being picked up
func throw_book():
	if gamestate.has_book and not gamestate.book_used_in_fireplace:
		get_tree().change_scene_to_file("res://smoke_puff.tscn")
		#emit_signal("book_thrown")
		gamestate.book_used_in_fireplace = true
		GameState.d_fire_book = false
		GameState.d_clover = true
		GameState.spawn_2_enem = true
		print("You threw the book into the fireplace. It starts to burn.")
		$Label.visible = false 
		#get_tree().change_scene_to_file("res://smoke_puff.tscn")
