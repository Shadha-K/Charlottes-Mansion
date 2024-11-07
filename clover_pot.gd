extends Area2D

@onready var label: Label = $Label
@onready var label2: Label = $Label2
@onready var clover_plant: Sprite2D = $Sprite2D2

func _ready():
	label.visible = false
	label2.visible = false
	clover_plant.visible = false  

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
			clover_plant.visible = true
			get_tree().change_scene_to_file("res://glowing_clover.tscn")
			#GlobalHotbar.item_used("Clover")
			
	if not GameState.has_clubs:
		if Input.is_action_just_pressed("interact") and label2.visible:
			label2.visible = false;
			GameState.has_clubs = true
			GlobalHotbar.add_item_to_slot("Club Card", preload("res://assets/puzzle_objects/AceOfClubs.png"))
			
func interact_with_pot():
	$Label.visible = false
	get_tree().root.get_node("GameState").make_plant_grow()
