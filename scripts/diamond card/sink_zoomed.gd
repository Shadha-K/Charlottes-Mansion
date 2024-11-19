extends Node2D 

var next_room_scene = "res://kitchen.tscn" 
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $AnimatedSprite2D/Label
@onready var hotbar = get_node("CanvasLayer/Hotbar")

func _ready():
		label.visible = false 

func _process(_delta):
	if Input.is_action_just_pressed("click or drag"):
		label.visible = true
		GameState.sink_interacted = true 
		GlobalHotbar.add_item_to_slot("Filled Cup", preload("res://assets/puzzle_objects/puzzle_cup_full.png"))
		hotbar._reload_slots()
		
	if Input.is_action_just_pressed("interact"):
		get_tree().root.get_node("GameState").has_water = true
		get_tree().change_scene_to_file(next_room_scene)
