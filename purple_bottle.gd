extends Area2D

# Signal emitted when the book is picked up
signal bottle_picked_up()

@onready var player = null  
@onready var hotbar = get_node("/root/living_room/UI/Hotbar")  
@onready var label = $Label  # Correctly reference the Label

func _ready():
	label.visible = false  # Set label visibility to false by default
	var grandparent = get_parent().get_parent()
	player = grandparent.get_node("Alex")
	add_to_group("Bottle")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Alex": 
		label.visible = true  

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Alex": 
		label.visible = false  

func _process(_delta):
	if Input.is_action_just_pressed("interact"):  
		if label.visible:  
			pick_up_bottle()

func pick_up_bottle():
	emit_signal("bottle_picked_up")  
	GlobalHotbar.add_item_to_slot("Bottle", preload("res://assets/puzzle_objects/tempbottle.png"))
	queue_free()  
