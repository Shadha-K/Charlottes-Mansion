extends Area2D

# Variables
var player_near = false  

# Reference to the Label node for displaying "Press E" prompt
@onready var press_e_label = $Label 
@onready var tea: Area2D = $"."

# Signal to notify that the item has been picked up
#signal item_picked_up(item_name)

func _ready():
	press_e_label.visible = false 
	body_entered.connect(_on_TeaCup_body_entered)
	body_exited.connect(_on_TeaCup_body_exited)

# Function to detect when the player enters the interaction area
func _on_TeaCup_body_entered(body: Node) -> void:
	if body.name == "CharacterBody2D":  # Assuming your player is named "CharacterBody2D"
		player_near = true
		press_e_label.visible = true  # Show the "Press E" prompt

# Function to detect when the player leaves the interaction area
func _on_TeaCup_body_exited(body: Node) -> void:
	if body.name == "CharacterBody2D":
		player_near = false
		press_e_label.visible = false

# Function to listen for the 'interact' key while the player is near
func _process(_delta: float) -> void:
	if player_near and Input.is_action_just_pressed("interact"):
		pick_up_item()

# Function to pick up the tea cup
func pick_up_item() -> void:
	emit_signal("item_picked_up", "Tea Cup")
	queue_free()  # Remove the tea cup from the scene
