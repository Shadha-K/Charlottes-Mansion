extends Node2D

func _ready():
	if GameState.first_time:
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/opening.dialogue"), "start")
		GameState.first_time = false
		return
