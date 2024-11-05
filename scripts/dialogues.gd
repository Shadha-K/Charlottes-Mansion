extends Node2D

@onready var label: Label = $/root/living_room/UI/dialogue_box/Label
@onready var label2: Label = $/root/living_room/UI/dialogue_box/Label2
@onready var box: Sprite2D = $/root/living_room/UI/dialogue_box/Sprite2D
@onready var charlotte: Sprite2D = $/root/living_room/UI/dialogue_box/Sprite2D2

var dialogues1 = [
	"Well, wherever you’re\ngoing, I promise you\ndon’t want to be here.",
	"And I don’t really want\nto be here either…",
	"You know, I’ve tried\nleaving before, but the\nonly way out is that\ndoor over there",
	"and paws aren’t very\nconductive to opening\ndoors…",
	"Think you can help me\nleave too?"
]

var current_dialogue_index = 0

func _ready():
	if GameState.start_game:
		label.visible = true
		label2.visible = true
		box.visible = true
		charlotte.visible = true
		current_dialogue_index = 0 
	else:
		label.visible = false
		label2.visible = false
		box.visible = false
		charlotte.visible = false

func _process(_delta):
	if GameState.start_game:
		if Input.is_action_just_pressed("dialogue"):
			if current_dialogue_index < dialogues1.size():
				label.text = dialogues1[current_dialogue_index]
				current_dialogue_index += 1
			else:
				GameState.start_game = false
				label.visible = false
				label2.visible = false
				box.visible = false
				charlotte.visible = false
