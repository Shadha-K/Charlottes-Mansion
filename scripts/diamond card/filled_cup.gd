extends Area2D

signal filled_cup_picked_up()

@onready var label: Label = $Label 
@onready var hotbar = get_node("/root/Hotbar")

func _ready():
	label.visible = false 
	
	var game_state = get_tree().root.get_node("GameState")
	self.connect("filled_cup_picked_up", Callable(game_state, "_on_filled_cup_picked_up"))

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Alex" and get_tree().root.get_node("GameState").has_teacup: 
		label.visible = true 

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Alex": 
		label.visible = false  

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and label.visible:  
		pick_up_filled_cup()

func pick_up_filled_cup():
	emit_signal("filled_cup_picked_up")  # Emit the signal here
	hotbar.add_item_to_slot(1, "Filled Cup", preload("res://assets/puzzle_objects/puzzle_cup_full.png")) 
	queue_free()
