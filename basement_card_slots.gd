extends Node2D 

var next_scene = "res://node_2d.tscn" 
@onready var diamond_card: Sprite2D = $AceOfDiamonds

func _ready():
	diamond_card.visible = false

func _process(_delta):
	if Input.is_action_just_pressed("click or drag") and GameState.has_diamond:
		GameState.diamond_card = true
		
	if GameState.diamond_card:
		diamond_card.visible = true

	if Input.is_action_just_pressed("interact"):  
		get_tree().change_scene_to_file(next_scene)
