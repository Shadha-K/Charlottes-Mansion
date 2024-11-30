extends Node2D 

var next_scene = "res://kitchen.tscn" 
@onready var label: Label = $Label
@onready var milk_sprite: Sprite2D = $Milk

func _ready():
	label.visible = false 
	milk_sprite.visible = true 

func _process(_delta):
	if Input.is_action_just_pressed("click or drag"):
		label.visible = true
		milk_sprite.visible = false
		if(not GameState.has_milk):
			GameState.has_milk = true
			GameState.spawn_icebox = true
			GlobalHotbar.add_item_to_slot("Milk", preload("res://assets/puzzle_objects/milk.png"))

	if Input.is_action_just_pressed("interact") and GameState.has_milk:
		get_tree().change_scene_to_file(next_scene)
