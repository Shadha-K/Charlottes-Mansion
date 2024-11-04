extends Node2D 

var next_scene = "res://bedroom.tscn" 
@onready var label: Label = $Label
@onready var second_sprite: Sprite2D = $JewelryBoxOpenEmpty

func _ready():
	label.visible = false 
	second_sprite.visible = false  

func _process(_delta):
	if Input.is_action_just_pressed("click or drag"):
		label.visible = true
		second_sprite.visible = true  

	if Input.is_action_just_pressed("interact"):
		get_tree().root.get_node("GameState").has_diamond = true
		get_tree().change_scene_to_file(next_scene)
