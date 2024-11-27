extends Node2D 

var next_scene = "res://kitchen.tscn" 
@onready var label: Label = $Label
@onready var flour_sprite: Sprite2D = $Flour
@onready var sugar_sprite: Sprite2D = $Sugar

func _ready():
	label.visible = false 
	flour_sprite.visible = true 
	sugar_sprite.visible = true

func _process(_delta):
	if Input.is_action_just_pressed("click or drag"):
		label.visible = true
		flour_sprite.visible = false
		sugar_sprite.visible = false
		if(not GameState.has_flour):
			GameState.has_flour = true
			GameState.has_sugar = true
			GlobalHotbar.add_item_to_slot("Flour", preload("res://assets/puzzle_objects/flour.png"))
			GlobalHotbar.add_item_to_slot("Sugar", preload("res://assets/puzzle_objects/sugar.png"))

	if Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file(next_scene)