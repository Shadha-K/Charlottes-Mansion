extends Area2D

# Signal emitted when the teacup is picked up
signal teacup_picked_up()

@onready var player = null  
@onready var hotbar = get_node("/root/Hotbar")  

# Function called when the scene is ready
func _ready():
	$Label.visible = false
	player = get_parent().get_node("CharacterBody2D")
	add_to_group("Teacups")

# Function called when something enters the area (the player)
func _on_body_entered(body: Node2D) -> void:
		if body.name == "CharacterBody2D": 
			$Label.visible = true  

# Function called when something exits the area (the player)
func _on_body_exited(body: Node2D) -> void:
		if body.name == "CharacterBody2D": 
			$Label.visible = true  

# Function to process player input (e.g., picking up the teacup)
func _process(_delta):
	if Input.is_action_just_pressed("interact"):  
		if $Label.visible:  
			pick_up_teacup()

# Function to handle the teacup being picked up
func pick_up_teacup():
	emit_signal("teacup_picked_up")  
	hotbar.add_item_to_slot(0, "Teacup", preload("res://assets/puzzle_objects/puzzle_cup.png"))  
	queue_free()  
