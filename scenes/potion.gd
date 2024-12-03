extends Area2D

@onready var player = null  
@onready var hotbar = get_node("/root/living_room/UI/Hotbar")  
@onready var label = $Label  # Correctly reference the Label

func _ready():
	label.visible = false  # Set label visibility to false by default
	var grandparent = get_parent().get_parent()
	player = grandparent.get_node("Alex")


	if GameState.has_bottle:
		queue_free()
	

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Alex" and GameState.has_hearts: #add here condition to be met once 3rd puzzle is done
		label.visible = true  

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Alex": 
		$Label.visible = false  

func _process(_delta):
	if Input.is_action_just_pressed("interact"):  
		if $Label.visible:  
			pick_up_bottle()

func pick_up_bottle():
	if not GameState.has_bottle:
		GlobalHotbar.add_item_to_slot("Bottle", preload("res://assets/puzzle_objects/Purple Bottle 1.png"))
		GameState.d_vial = true
		GameState.has_bottle = true
		GameState.spawn_2_enem = true
		$Label.visible=false
		queue_free() 
	if GameState.has_bottle:
		$Label.visible=false
