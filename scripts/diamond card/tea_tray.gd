extends Area2D

signal teacup_picked_up()

@onready var player = null  
@onready var hotbar = get_node("/root/living_room/UI/Hotbar")
@onready var label: Label = $Label

func _ready():
	label.visible = false
	var grandparent = get_parent().get_parent()
	player = grandparent.get_node("Alex")
	
	if GameState.has_teacup:
		queue_free()
		
	var game_state = get_tree().root.get_node("GameState")
	self.connect("teacup_picked_up", Callable(game_state, "_on_teacup_picked_up"))

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
		emit_signal("teacup_picked_up")  
		GlobalHotbar.add_item_to_slot(0, "Teacup", preload("res://assets/puzzle_objects/puzzle_cup.png"))  
		get_tree().root.get_node("GameState").has_teacup = true 
		queue_free() 
