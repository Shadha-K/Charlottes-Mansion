extends Area2D

@onready var player = null  
@onready var hotbar = get_node("/root/living_room/UI/Hotbar")
@onready var label: Label = $Label

func _ready():
	label.visible = false
	var grandparent = get_parent().get_parent()
	player = grandparent.get_node("Alex")
	
	if GameState.has_teacup:
		queue_free()
		
	#var game_state = get_tree().root.get_node("GameState")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Alex" and not get_tree().root.get_node("GameState").has_teacup: 
		label.visible = true  
 
func _on_body_exited(body: Node2D) -> void:
	if body.name == "Alex": 
		label.visible = false  

func _process(_delta):
	if Input.is_action_just_pressed("interact"):  
		if label.visible:  
			pick_up_teacup()

func pick_up_teacup():
	if not get_tree().root.get_node("GameState").has_teacup:
		GlobalHotbar.add_item_to_slot("Teacup", preload("res://assets/puzzle_objects/puzzle_cup.png"))  
		get_tree().root.get_node("GameState").has_teacup = true 
		GameState.d_teacup = true
		queue_free() 
