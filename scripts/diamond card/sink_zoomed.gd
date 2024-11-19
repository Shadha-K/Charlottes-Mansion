extends Node2D 

var next_room_scene = "res://kitchen.tscn" 
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $AnimatedSprite2D/Label

func _ready():
		label.visible = false 

func _process(_delta):
	if Input.is_action_just_pressed("click or drag"):
		label.visible = true
		GameState.sink_interacted = true 
		GlobalHotbar.add_item_to_slot("Filled Cup", preload("res://assets/puzzle_objects/puzzle_cup_full.png"))
		
	if Input.is_action_just_pressed("interact"):
		get_tree().root.get_node("GameState").has_water = true
		GameState.d_teacup = false
		GameState.d_full_cup = true
		get_tree().change_scene_to_file(next_room_scene)
