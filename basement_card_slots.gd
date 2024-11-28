extends Node2D 

var next_scene = "res://node_2d.tscn"
var basement_scene = "res://basement.tscn"
@onready var diamond_card: Sprite2D = $AceOfDiamonds
@onready var club_card: Sprite2D = $AceOfClubs
@onready var heart_card: Sprite2D = $AceofHearts
@onready var label: Label = $Label
@onready var label2: Label = $Label2
@onready var label3: Label = $Label3

func _ready():
	diamond_card.visible = false
	club_card.visible = false
	heart_card.visible = false
	label.visible = true
	label2.visible = true
	label3.visible = false
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/basementdoor.dialogue"), "start")
	GameState.first_time = false
	return
	
func _process(_delta):
	# Update visibility of diamond card
	if GameState.diamond_card:
		diamond_card.visible = true

	# Update visibility of club card
	if GameState.club_card:
		club_card.visible = true
		#label.visible = false
		#label2.visible = false
		#label3.visible = true
		
	if GameState.heart_card:
		heart_card.visible = true

	if Input.is_action_just_pressed("interact"):
		if GameState.club_card:
			#get_tree().change_scene_to_file(basement_scene)
		#else:
			get_tree().change_scene_to_file(next_scene)
		else:
			get_tree().change_scene_to_file(next_scene)
