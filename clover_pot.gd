extends Area2D

@onready var label: Label = $Label
@onready var label2: Label = $Label2
@onready var glowing_plant: AnimatedSprite2D = $glowingclover
@onready var clover: Sprite2D = $Clover

func _ready():
	label.visible = false
	label2.visible = false
	glowing_plant.visible = false 
	clover.visible = false 

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Alex" and get_tree().root.get_node("GameState").has_clover and not GameState.clover_planted: 
		label.visible = true 
	if body.name == "Alex" and get_tree().root.get_node("GameState").clover_planted and not GameState.has_clubs: 
		label2.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Alex":
		label.visible = false
		label2.visible = false

func _process(_delta):
	if not GameState.clover_planted:
		if Input.is_action_just_pressed("interact") and label.visible:
			label.visible = false
			label2.visible = true
			GameState.clover_planted = true
			glowing_plant.visible = true
			glowing_plant.play("glowingclover")
			GlobalHotbar.item_used("Clover")
			
	elif not GameState.has_clubs and GameState.clover_planted:
		if Input.is_action_just_pressed("interact") and label2.visible:
			label2.visible = false;
			GameState.has_clubs = true
			glowing_plant.visible = false
			clover.visible = true
			GlobalHotbar.add_item_to_slot("Club Card", preload("res://assets/puzzle_objects/AceOfClubs.png"))
			
func interact_with_pot():
	$Label.visible = false
	get_tree().root.get_node("GameState").make_plant_grow()
