extends Node2D 

var next_scene = "res://bedroom.tscn" 
@onready var label: Label = $Label
@onready var second_sprite: Sprite2D = $JewelryBoxOpenEmpty
var spawn_point_name = "JBoxToBRAlex"
var spawn_point_name2 = "JBoxToBRChar"
func _ready():
	label.visible = false 
	second_sprite.visible = false  

func _process(_delta):
	if Input.is_action_just_pressed("click or drag"):
		label.visible = true
		second_sprite.visible = true
		GameState.jewelry_box_open = true
		if(not GameState.added_diamond):
			GlobalHotbar.add_item_to_slot("Diamond Card", preload("res://assets/puzzle_objects/AceOfDiamonds.png"))
			GameState.added_diamond = true
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/card_found.dialogue"), "start")
			GameState.d_first_card = false
			GameState.d_middle_cards = true
			GameState.d_has_code = false

	if Input.is_action_just_pressed("interact"):
		get_tree().root.get_node("GameState").has_diamond = true
		GameState.last_scene_exited="JBox"
		GameState.JBoxToBR_spawn_Alex= spawn_point_name
		GameState.JBoxToBR_spawn_Char=spawn_point_name2
		get_tree().change_scene_to_file(next_scene)
