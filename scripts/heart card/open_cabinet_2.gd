extends Node2D 

var next_scene = "res://kitchen.tscn" 
@onready var label: Label = $Label
@onready var apple_sprite: Sprite2D = $Apples

func _ready():
	label.visible = false 
	apple_sprite.visible = true 

func _process(_delta):
	if Input.is_action_just_pressed("click or drag"):
		label.visible = true
		apple_sprite.visible = false
		if(not GameState.has_apples):
			GlobalHotbar.add_item_to_slot("Apples", preload("res://assets/puzzle_objects/apples.png"))
			GameState.has_apples = true

	if Input.is_action_just_pressed("interact") and GameState.has_apples:
		get_tree().change_scene_to_file(next_scene)
